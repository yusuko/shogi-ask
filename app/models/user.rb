class User < ApplicationRecord
  mount_uploader :image, UserImageUploader
  has_many :questions
  has_many :replies
  has_many :comments
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[twitter]

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      random_string = (0... 10).map{ (65 + rand(26)).chr }.join
      auth.info.email = "#{random_string}@fakefake.com" unless auth.info.email
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.remote_image_url = auth.info.image.gsub('http', 'https')
      user.skip_confirmation!
    end
  end
end
