class Vote < ActiveRecord::Base
  attr_accessible :vote_type, :voteable_id, :voteable_type
  belongs_to :voteable, polymorphic: true
#CR why does this need to be a model method?
  def self.assign_vote_attributes(vote, params)
    vote.update_attributes(
        vote_type: params[:vote_type],
        voteable_id: params[:voteable_id],
        voteable_type: params[:voteable_type]
        )
  end
end
