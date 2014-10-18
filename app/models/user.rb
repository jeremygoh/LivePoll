class User < ActiveRecord::Base
  has_many :poll_centres
  has_many :vote_a
  has_many :vote_b
  has_many :vote_c
  has_many :vote_d

  def has_voted?(question_id)
    VoteA.where(user_id: self.id, question_id: question_id).exists? || VoteB.where(user_id: self.id, question_id: question_id).exists? || VoteC.where(user_id: self.id, question_id: question_id).exists? ||VoteD.where(user_id: self.id, question_id: question_id).exists?
  end

  def selected_answer(question_id)
    if VoteA.where(user_id: self.id, question_id: question_id).exists?
      "A"
    elsif VoteB.where(user_id: self.id, question_id: question_id).exists?
      "B"
    elsif VoteC.where(user_id: self.id, question_id: question_id).exists?
      "C"
    elsif VoteD.where(user_id: self.id, question_id: question_id).exists?
      "D"
    else
      nil
    end
  end

end
