require 'rails_helper'

RSpec.describe Post, type: :model do
  # Test association
  # ensure Post has a relationship with the Comment
  it { should have_many(:comments).dependent(:destroy) }

  # Validation test
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:created_by) }
end
