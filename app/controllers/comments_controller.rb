class CommentsController < ApplicationController

  def create
    #CR if you have more than two commentable types it's worth creating a method
      # to generalize this step
#      @commentable = Question.find(params[:question_id]) if params[:question_id]
 #     @commentable = Answer.find(params[:answer_id]) if params[:answer_id]

    if params[:answer_id] == nil

      @question = Question.find(params[:question_id])
      #CR Polymorphism helps here :
      #CR @comment = @commentable.comments.build(params[:comment])
      #CR @comment.user = current_user

      create_comment_for('Question')
      @comment.commentable_id = @question.id
      render_comment_or_error
      #CR the render is the same in both if and else so factor it out
    else
      @answer = Answer.find(params[:answer_id])
      create_comment_for('Answer')
      @comment.commentable_id = @answer.id
      render_comment_or_error
    end
  end

  private

  def create_comment_for(type)
#CR see refactor above
    @comment = Comment.new(params[:comment])
    @comment.commentable_type = type
    @comment.user_id = session[:user_id]
  end

  def render_comment_or_error
    if @comment.save
      render partial:'/shared/comments', locals: {comment: @comment}
    else
      @errors = 'Comment cannot be blank'
      render partial: '/shared/errors', locals: {errors: @errors}, :status => :unprocessable_entity
    end
  end

end
