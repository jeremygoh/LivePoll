class AddUserRefToPollCentres < ActiveRecord::Migration
  def change
    add_reference :poll_centres, :user, index: true
  end
end
