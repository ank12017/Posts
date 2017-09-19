class Post < ApplicationRecord
	belongs_to :user
	has_many :reviews
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
                    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/



  include Rails.application.routes.url_helpers

  def to_jq_post
    {
      "name" => read_attribute(:avatar_file_name),
      "size" => read_attribute(:avatar_file_size),
      "url" => self.avatar.url(:original),
      "delete_url" => post_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
