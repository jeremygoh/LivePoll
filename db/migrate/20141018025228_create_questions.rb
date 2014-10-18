class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.boolean :started
      t.boolean :finished
      t.references :poll_centre, index: true

      t.timestamps
    end
  end
end
