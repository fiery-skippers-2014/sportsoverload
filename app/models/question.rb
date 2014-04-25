class Question < ActiveRecord::Base
    validates_presence_of :title, :user, :body
    attr_accessible :title, :body
    belongs_to :user
    has_many :answers
end