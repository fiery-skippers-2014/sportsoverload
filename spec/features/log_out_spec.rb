require 'spec_helper'

feature "log out" do
  let!(:user) { FactoryGirl.create :user }

  before :each do
    visit root_path
    click_on "Log In"
    fill_in 'Username', :with => user.username
    fill_in 'Password', :with => user.password
    click_on "Sign In"
  end

  scenario "able to see log out button" do
    expect(page).to have_content("Log Out")
  end

  scenario "able to log out" do
    click_on "Log Out"
    expect(page).to have_content("Log In")
  end

  scenario "not able to view other users' profile page" do
    click_on "Log Out"
    visit user_path(user)
    expect(page).to_not have_content user.username
  end
end

