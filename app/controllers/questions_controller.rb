class QuestionsController < ApplicationController

  def index

    @questions = Question.order('created_at desc')
    @votes = Question.questions_with_most_votes
    @trending = Question.question_with_recent_votes
    p @trending
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      render :nothing => true
    end
  end

  def show
    @comment = Comment.new
    @answer = Answer.new
    @question = Question.find params[:id]
    @answers = @question.order_answers_by_latest
  end

end