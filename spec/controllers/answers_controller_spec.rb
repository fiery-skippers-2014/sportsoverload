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
  end
end