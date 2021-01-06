class Comment < ApplicationRecord
  belongs_to :member, polymorphic: true
  belongs_to :book
end
