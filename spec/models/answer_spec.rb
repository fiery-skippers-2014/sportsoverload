require 'spec_helper'

describe Answer do
  context "associations" do
    it {should belong_to :user}
    it {should belong_to :question}
    it {should have_many :votes}
  end
  context "validations" do
    it {should validate_presence_of :body}
  end

  context "vote_count" do
    let!(:answer) { FactoryGirl.create :answer }
    it "should get the difference between upvotes and downvotes" do
      10.times do
        answer.votes << Vote.create(
          vote_type: [true, false].sample,
          voteable_id: answer.id,
          voteable_type: answer.class.to_s
          )
      end
      expect(answer.vote_count). to be < 10
    end
  end
end
