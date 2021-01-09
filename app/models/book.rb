class Book < ApplicationRecord
  belongs_to :category
  has_one_attached :cover, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_of_users, class_name: 'BookOfUser', dependent: :destroy
  has_many :users, through: :book_of_users

  validates :title, :description, :author_name, presence: true

  def set_cover
    self.cover.attached? ? self.cover : 'bookcover.jpg'
  end
end
