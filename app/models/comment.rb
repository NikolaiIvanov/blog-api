class Comment < ApplicationRecord
  # Association
  belongs_to :post

  # validation
  validates :name, :body, presence: true
end
