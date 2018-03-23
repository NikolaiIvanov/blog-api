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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Test association
  it { should belong_to(:post) }

  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
end
