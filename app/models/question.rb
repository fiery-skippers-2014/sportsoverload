class Question < ActiveRecord::Base
    has_many :comments, as: :commentable
    has_many :votes, as: :voteable
    validates_presence_of :title, :user, :body
    attr_accessible :title, :body
    belongs_to :user
    has_many :answers

  def vote_count
    up_votes = self.votes.select {|vote| vote.vote_type == true}
    down_votes = self.votes.select {|vote| vote.vote_type == false}
    up_votes.length - down_votes.length
  end

  def order_answers_by_latest
    self.answers.order('created_at desc')
  end

  def self.questions_with_most_votes
    questions = Question.all
    question_votes = {}
    questions.each do |question|
        question_votes[question] = [question.votes.count]
    end
    question_votes = question_votes.sort_by {|k,v| v }.reverse
  end

   def self.question_with_recent_votes
    votes = Vote.all
    questions = {}
    votes.each do |vote|
        if vote.voteable_type = 'Question'
            questions[vote.voteable] = vote.created_at
        end
    end
    questions.sort_by{|k,v| v }.reverse
   end
end