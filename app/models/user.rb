class User < ActiveRecord::Base
  has_many :poll_centres
end
