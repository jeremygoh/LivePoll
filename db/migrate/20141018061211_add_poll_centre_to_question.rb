class AddPollCentreToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :poll_centre, index: true
  end
end
