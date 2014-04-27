class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  attr_accessible :body
  belongs_to :question
  belongs_to :user
  validates_presence_of :body

  def vote_count
    up_votes = self.votes.select {|vote| vote.vote_type == true}
    down_votes = self.votes.select {|vote| vote.vote_type == false}
    up_votes.length - down_votes.length
  end
end