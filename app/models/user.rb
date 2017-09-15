class User < ApplicationRecord
    has_many :posts
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
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end
end

end
