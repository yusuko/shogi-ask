class User < ApplicationRecord
  mount_uploader :image, UserImageUploader
  has_many :questions
  has_many :replies
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
