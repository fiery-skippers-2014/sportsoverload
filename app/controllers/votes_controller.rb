class VotesController < ApplicationController

  def update
    vote = Vote.create
    if vote && params[:vote_type] == true
      p params
      Vote.assign_vote_attributes(vote, params)
      constant = params[:voteable]["type"].classify.constantize
      @voteable = constant.find(params[:voteable]["id"])
      render partial:'/shared/vote_count', locals: { voteable: @voteable }
    else
      Vote.assign_vote_attributes(vote, params)
      constant = params[:voteable]["type"].classify.constantize
      @voteable = constant.find(params[:voteable]["id"])
      render partial:'/shared/vote_count', locals: { voteable: @voteable }
    end
  end
end