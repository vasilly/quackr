require 'rails_helper'

RSpec.describe Question, :type => :model do
  
  it "new question defaults to draft" do
    question = Question.new
    expect(question.status).to eq 'draft'
  end

  it 'cannot save question without title' do
    question = Question.new
    expect(question.save).to eq false
  end

  describe '#body_html' do

    it 'converts markdown in body and return html' do
      # '### h3 title'
      # "<h3>h3 title</h3>\n"

      question = Question.new
      question.body = '### h3 title'
      expect(question.body_html).to eq("<h3>h3 title</h3>\n") 
    end

  end

end
