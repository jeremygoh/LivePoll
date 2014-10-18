class PollCentre < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  validates :title, uniqueness: true, presence: true
  before_save :format_title

  def format_title
    self.title = title.strip.gsub(/\s+/, '-').downcase
  end
end
