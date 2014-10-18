class Question < ActiveRecord::Base

  def a_votes
    #count number of a votes for that question
    VoteA.where(question_id: self.id).count
  end

  def b_votes
    #count number of a votes for that question
    VoteB.where(question_id: self.id).count
  end

  def c_votes
    #count number of a votes for that question
    VoteC.where(question_id: self.id).count
  end

  def d_votes
    #count number of a votes for that question
    VoteD.where(question_id: self.id).count
  end

  def total_votes
    a_votes + b_votes + c_votes + d_votes
  end

end
