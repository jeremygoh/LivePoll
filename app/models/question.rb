class Question < ActiveRecord::Base
  belongs_to :poll_centre
  has_many :vote_a
  has_many :vote_b
  has_many :vote_c
  has_many :vote_d
end
