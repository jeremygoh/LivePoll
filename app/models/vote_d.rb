class VoteD < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
   validates_presence_of :user_id
  validates_presence_of :question_id
end
