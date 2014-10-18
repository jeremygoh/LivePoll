class PollCentre < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  validates :title, uniqueness: true, presence: true
  before_save :format_title

  def format_title
    self.title = title.strip.gsub(/\s+/, '-').downcase
  end

  def has_current_question?
    #figure out if there are any questions associated with at that poll centre id that are have started and are not finished
    Question.where(poll_centre_id: self.id, started: true, finished: false).exists?
  end

  def has_unasked_questions?
    Question.where(poll_centre_id: self.id, started: false).exists?
  end
end
