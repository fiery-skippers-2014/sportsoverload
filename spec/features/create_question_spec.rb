require 'spec_helper'

feature 'create a question', js: true do
  let!(:a_question) {FactoryGirl.attributes_for :question}
    let!(:user) { FactoryGirl.create :user }
      before(:each) do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      end
  scenario 'create a valid question' do
      
  

    visit root_path
    click_on 'Ask Question'
    
      fill_in 'Title', :with => "blahhh"
      fill_in 'Body', :with => "a_question.body"
   
      click_on "Create Question"
      expect(page).to have_content("a_question.body")
  end
end
