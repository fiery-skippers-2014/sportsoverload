require 'spec_helper'

feature 'create a question' do
  let!(:a_question) {FactoryGirl.attributes_for :question}
    # before(:each) do
    #   user = FactoryGirl.create(:user)
    #   user.stub(:name).and_return('bob')
    #   SessionController.stub(:class_method).and_return('something')
    #   fake_controller = double(SessionController)
    #   SessionController.stub(:new).and_return(fake_controller)
    #   fake_controller.stub(:instance_method).and_return('...')
    # end
  scenario 'create a valid question' do
    visit root_path
    click_on 'ask new question'
    within ('#new_question') do
      fill_in 'Title', with: a_question[:title]
      fill_in 'Body', with: a_question[:body]
    end
      click_on 'Create Question'
      expect(page).to have_content(a_question[:title])
  end
end
