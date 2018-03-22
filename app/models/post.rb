class Post < ApplicationRecord
  # Association
  has_many :comments, dependent: :destroy


  # Validations
  validates :title, :body, :created_by, presence: true
end
