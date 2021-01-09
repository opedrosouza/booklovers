class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  has_many :comments, as: :member, dependent: :destroy
  has_many :book_of_users, class_name: 'BookOfUser', dependent: :destroy
  has_many :books, through: :book_of_users

  validates :name, presence: true

  def set_avatar
    self.avatar.attached? ? self.avatar : 'user-avatar.png'
  end
end
