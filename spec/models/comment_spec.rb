require 'spec_helper'

describe Comment do
  context 'validation' do
    it { should validate_presence_of(:body) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
    it { should have_many(:votes)}
  end
end