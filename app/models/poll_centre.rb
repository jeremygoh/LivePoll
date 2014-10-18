class PollCentre < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  validates :title, uniqueness: true, presence: true
end
