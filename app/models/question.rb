class Question < ActiveRecord::Base
  belongs_to :poll_centre
  has_many :vote_a
  has_many :vote_b
  has_many :vote_c
  has_many :vote_d
  before_save :set_started_finished
  validates_presence_of :text

  def set_started_finished
    self.started = false
    self.finished = false
  end

end
