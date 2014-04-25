require 'spec_helper'

describe SessionsController do
  let!(:user) { FactoryGirl.create :user }
  context "#create" do
    it "should find correct user" do
      expect {
        post :create, :session => { username: user.username, password: user.password }
      }.to change { session[:user_id] }
    end
  end
  context "#destroy" do
    it "should log a user out" do
        post :create, :session => { username: user.username, password: user.password }
        expect(session[:user_id]).to_not eq(nil)

        delete :destroy, id: user.id
        expect(session[:user_id]).to eq(nil)
    end
  end
end