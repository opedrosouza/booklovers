class BookOfUser < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: { 'to_read': 0, 'readed': 1, 'to_shop': 2 }

  validates :status, presence: true
end
