class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :voteable
  validates_presence_of :body
  attr_accessible :body

  def most_recent_comments_first(question)
    question.comments.order('created_at asc')
  end

#CR add method to vote model for up and down votes
  def vote_count
    up_votes = self.votes.select {|vote| vote.vote_type == true}
    down_votes = self.votes.select {|vote| vote.vote_type == false}
    up_votes.length - down_votes.length
  end
end
