class CreateVoteAs < ActiveRecord::Migration
  def change
    create_table :vote_as do |t|
      t.references :user, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
