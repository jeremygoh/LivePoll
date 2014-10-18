class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
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

  def correct?(question_id)
    selected = selected_answer(question_id)
    if selected.nil?
      false
    else
      selected == Question.find(question_id).correct_answer
    end
  end

  def answer_poll_centres
    #find all vote A questions, vote b questions ...
    #find all poll_cenres from there, do uniq

    output=[]
    questions = []
    questions.push(VoteA.where(user_id: self.id))
    questions.push(VoteB.where(user_id: self.id))
    questions.push(VoteC.where(user_id: self.id))
    questions.push(VoteD.where(user_id: self.id))
    questions.flatten!
    if !questions.empty?
      questions.each do |question|
        poll_centre = PollCentre.find(question.poll_centre_id)
        output.push(poll_centre)
      end
    end

    output.uniq
  end

end
