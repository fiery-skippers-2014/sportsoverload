require 'spec_helper'

describe UsersController do
  let!(:user_attr) { FactoryGirl.attributes_for :user }
  context "#sign up" do
    it "should return the sign up page" do
      get :sign_up
      expect(response).to be_success
    end

    it "should assign user variable to User.new" do
      get :sign_up
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context "#create" do
    it "should create a new user" do
      expect {
        post :create, :user => user_attr
      }.to change { User.count }.by(1)
    end

    it "should start a user session" do
      post :create, :user => user_attr
      expect(session[:user_id]). to eq(User.last.id)
    end
  end
end