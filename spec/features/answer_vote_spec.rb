require 'spec_helper'

feature "Voting on answer" do
  let!(:answer) { FactoryGirl.create :answer }
  let!(:question) { FactoryGirl.create :question }
  let!(:user) { FactoryGirl.create :user}
  before :each do
    page.set_rack_session(:user_id => user.id)
    visit question_path(question)
    click_on "Answer this Question"
    fill_in "answer", with: answer.body
    click_on "submit"
  end

  scenario "a user can vote an answer up", js: true do
    within ".answers" do
      click_button "Boss"
    end
    expect(page).to have_content(answer.vote_count)
  end
end

