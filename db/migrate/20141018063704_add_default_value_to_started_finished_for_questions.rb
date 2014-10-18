class AddDefaultValueToStartedFinishedForQuestions < ActiveRecord::Migration
  def up
    change_column :questions, :started, :boolean, :default => false
    change_column :questions, :finished, :boolean, :default => false
  end

  def down
    change_column :questions, :started, :boolean, :default => nil
    change_column :questions, :finished, :boolean, :default => nil
  end
end
