require 'spec_helper'

feature "signing up" do
  let!(:user) { FactoryGirl.create :user }
  let!(:user_attr) { FactoryGirl.attributes_for :user }
  scenario "able to go to sign up page" do
    visit root_path
    click_on "Sign Up"
    expect(page).to have_content("Email")
  end

  scenario "able to sign up" do
    visit sign_up_path
    fill_in 'Username', :with => user_attr[:username]
    fill_in 'Email', :with => user_attr[:email]
    fill_in 'Password', :with => user_attr[:password]

    click_on 'Create User'

    expect(page).to have_content("Welcome #{user_attr[:username]}")
  end
end
