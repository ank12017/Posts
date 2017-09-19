class User < ApplicationRecord
    has_many :posts
    has_many :reviews
    # Include default devise modules. Others available are:
    #  :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :authentication_keys => [:login], :omniauth_providers => [:facebook]
           

     has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    def login=(login)
      @login = login
    end

    def login
      @login || self.username || self.email
    end

   def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
       if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
       else
         if conditions[:username].nil?
          where(conditions).first
         else
          where(username: conditions[:username]).first
        end
      end
   end


   def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
end

end
