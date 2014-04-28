class QuestionsController < ApplicationController

  def index

    @questions = Question.order('created_at desc')
    @votes = Question.questions_with_most_votes
    @trending = Question.question_with_recent_votes
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]
    @question.user_id = current_user.id
    #CR don't set the id directly @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
    else
      #CR this should go somewhere!
      render :nothing => true
    end
  end

  def show
    @comment = Comment.new
    @answer = Answer.new
    @question = Question.find params[:id]
    @answers = @question.order_answers_by_votes
    # @answers = @question.order_answers_by_latest
  end

end
