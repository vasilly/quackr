require 'rails_helper'

RSpec.feature 'question management', focus: true do

  context 'when logged in' do

    scenario 'create new question' do
      visit new_question_path
      fill_in "Title", :with => 'my first question'
      fill_in "Body", :with => 'hello **big** world'
      click_button "Save"

      expect(page).to have_text("Question is successfully saved")

      within 'form.edit_question' do
        expect(find_field('Title').value).to have_text "my first question"
        expect(find_field('Body')).to have_text "hello **big** world"
      end
    end

    scenario 'edit draft question' do
      # first our db is empty
      # i need an existing question in the db
      question = Question.create(title: 'hard question', body: '')

      # i shall navigate to the edit form
      visit edit_question_path(question)

      expect(find_field('Title').value).to have_text('hard question')
    end

  end

  context 'when logged out' do

    scenario 'view question' do
    end

  end
end