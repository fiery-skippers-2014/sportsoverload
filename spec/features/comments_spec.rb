require 'spec_helper'

feature 'add a comment' do
  let!(:question) { FactoryGirl.create(:question) }
  let!(:user) { FactoryGirl.create :user }
  let!(:comment) {FactoryGirl.attributes_for :comment}
     before(:each) do

    visit root_path
    click_on "Log In"
    fill_in 'Username', :with => user.username
    fill_in 'Password', :with => user.password
    click_on "Sign In"
     end
  scenario 'as a signed in user to a question with valid information' do
    visit question_path(question)
    # click_on 'comment on question'
    fill_in 'Comment', :with => comment[:body]
    click_on 'Submit Comment'
    expect(page).to have_content(comment[:body])

  end
end