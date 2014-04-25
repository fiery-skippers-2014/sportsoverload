require 'spec_helper'

feature 'answers' do
  let!(:user) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question }
  let!(:answer) {FactoryGirl.attributes_for :answer}
  scenario 'logged in and answer question' do
    visit root_path
    click_on "Log In"
    fill_in 'Username', :with => user.username
    fill_in 'Password', :with => user.password
    click_on "Sign In"
    visit question_path(question)
    fill_in "answer", :with => answer[:body]
    click_on 'submit'
    expect(page).to have_content(answer[:body])
  end
end