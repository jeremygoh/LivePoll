class CreateVoteBs < ActiveRecord::Migration
  def change
    create_table :vote_bs do |t|
      t.references :user, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
