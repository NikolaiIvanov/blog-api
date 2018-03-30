# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  published  :boolean
#  created_by :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  # Association
  has_many :comments, dependent: :destroy


  # Validations
  validates_presence_of :title, :body, :created_by
end
