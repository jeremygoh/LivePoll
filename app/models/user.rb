class User < ActiveRecord::Base
  has_many :poll_centres
  has_many :vote_a
  has_many :vote_b
  has_many :vote_c
  has_many :vote_d
end
