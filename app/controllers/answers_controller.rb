class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.new params[:answer]
    @answer.user_id = session[:user_id]
    @answer.save

    render partial:'/shared/answers', locals: {answer: @answer}
  end

end