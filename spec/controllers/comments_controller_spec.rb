require 'spec_helper'

describe CommentsController do
  context '#create' do
    let(:question) { FactoryGirl.create :question }
    let(:comment) {FactoryGirl.attributes_for :comment }
    it 'creates a new comment for a question' do
     expect{
      post :create, question_id: question.id, comment: comment
    }.to change { Comment.count }.by(1)
    end
  end
  #CR - always test valid and invalid params on create
end
