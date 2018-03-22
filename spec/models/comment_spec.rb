require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Test association
  it { should belong_to(:post) }

  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
end
