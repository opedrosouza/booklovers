class Comment < ApplicationRecord
  belongs_to :member, polymorphic: true
  belongs_to :book
  has_rich_text :content

  validates :member, :content, presence: true
end
