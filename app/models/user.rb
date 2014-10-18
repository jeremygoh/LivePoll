class User < ActiveRecord::Base
  has_many :poll_centres
  has_many :vote_a
  has_many :vote_b
  has_many :vote_c
  has_many :vote_d

  def has_voted?(question_id)
    VoteA.where(user_id: self.id).exists? || VoteB.where(user_id: self.id).exists? || VoteC.where(user_id: self.id).exists? ||VoteD.where(user_id: self.id).exists?
  end

end
