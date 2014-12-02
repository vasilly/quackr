class QuestionsController < ApplicationController

  def index
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to questions_path, :notice => 'Question is successfully saved'
    else
      render :new
    end 
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

end