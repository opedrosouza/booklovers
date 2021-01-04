class Book < ApplicationRecord
  has_one_attached :cover
  validates :title, :description, :author_name, presence: true

  def set_cover
    self.cover.attached? ? self.cover : 'bookcover.jpg'
  end
end
