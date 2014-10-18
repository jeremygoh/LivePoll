class AddIndexForTitleToPollCentres < ActiveRecord::Migration
  def change
    add_index :poll_centres, :title
  end
end
