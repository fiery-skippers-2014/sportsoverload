require 'spec_helper'

feature "Voting on comment" do
  let!(:comment) { FactoryGirl.create :comment }
  let!(:question) { FactoryGirl.create :question }
  let!(:answer) { FactoryGirl.create :answer }
  let!(:user) { FactoryGirl.create :user}
  before :each do
    page.set_rack_session(:user_id => user.id)
    visit question_path(answer.question)
    click_on "comment on question"
    fill_in "Comment", with: comment.body
    click_on "Submit Comment"
  end

  scenario "a user can vote an comment up", js: true do
    within ".question-comments" do
      click_button "Boss"
    end
    expect(page).to have_content(comment.vote_count)
  end
end

