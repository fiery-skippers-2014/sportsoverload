class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  attr_accessible :body, :best
  belongs_to :question
  belongs_to :user
  validates_presence_of :body

#CR add methods to vote model for up and down votes.
  def vote_count
    up_votes = self.votes.select {|vote| vote.vote_type == true}
    down_votes = self.votes.select {|vote| vote.vote_type == false}
    up_votes.length - down_votes.length
  end

  def best?
    self.best
  end

  def order_by_votes

  end
end
