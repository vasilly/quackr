require 'rails_helper'

RSpec.describe Question, :type => :model do
  
  it "new question defaults to draft" do
    question = Question.new
    expect(question.status).to eq 'draft'
  end

end
