class Book < ApplicationRecord
  belongs_to :category
  has_one_attached :cover, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :description, :author_name, presence: true

  def set_cover
    self.cover.attached? ? self.cover : 'bookcover.jpg'
  end
end
