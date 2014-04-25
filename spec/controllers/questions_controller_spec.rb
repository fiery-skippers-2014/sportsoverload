require 'spec_helper'

describe QuestionsController do

  context "#index" do
    let!(:question) { FactoryGirl.create :question}
    let!(:a_question) { FactoryGirl.create :question}
    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "assigns questions to all questions" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
    it "shows the correct number of questions" do
      get :index
      expect(Question.all.length).to eq(2)
    end
  end

  context "#show" do
    let(:question) { FactoryGirl.create :question}
    it "is successful" do
      get :show, id: question
      expect(response).to be_success
    end

    it 'assigns question to the question found by id' do
      get :show, id: question
      expect(assigns(:question)).to eq question
    end
  end
  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "assigns question to a new Question" do
      get :new
      expect(assigns(:question)).to be_a_new Question
    end
  end

  context '#create' do

    let!(:user) { FactoryGirl.create :user }
    let!(:a_question) {FactoryGirl.attributes_for :question}
    it 'creates a new question with valid params' do
    SessionsController.stub(:create).and_return(session[:user_id] = user.id)
      expect{
        post :create, :question => a_question
      }.to change {Question.count}.by(1)
    end

    it 'does not create a new question with invalid params' do
      expect{
        post :create, :question => a_question
      }.to_not change { Question.count }
    end
  end
end