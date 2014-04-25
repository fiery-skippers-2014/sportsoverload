class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]
    @question.user_id = session[:user_id]
    if @question.save
      redirect_to question_path(@question)
    else
      render :nothing => true
    end
  end

  def show
    @answer = Answer.new
    @question = Question.find params[:id]
  end












end