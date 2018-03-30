# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :string
#  published  :boolean
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#

class Comment < ApplicationRecord
  # Association
  belongs_to :post

  # validation
  validates_presence_of :name, :body
end
