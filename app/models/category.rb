class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :title, :description, presence: true
end
