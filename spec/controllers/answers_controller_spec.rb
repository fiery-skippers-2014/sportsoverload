require 'spec_helper'

describe AnswersController do
  context "#create" do
    let!(:answer) {FactoryGirl.attributes_for :answer}
    let!(:question) { FactoryGirl.create :question }
    it "creates a new answer with valid params" do

      expect{
        post :create, :question_id => question.id, :answer => answer
      }.to change {Answer.count}.by(1)
    end

    it "doesn't create a new answer with invalid params" do
      expect{
        post :create, :question_id => question.id, :answer => {body: nil}
      }.to_not change {Answer.count}

    end
  end
end