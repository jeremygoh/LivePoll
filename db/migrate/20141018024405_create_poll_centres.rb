class CreatePollCentres < ActiveRecord::Migration
  def change
    create_table :poll_centres do |t|
      t.string :title

      t.timestamps
    end
  end
end
