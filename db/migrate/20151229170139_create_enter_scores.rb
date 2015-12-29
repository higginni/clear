class CreateEnterScores < ActiveRecord::Migration
  def change
    create_table :enter_scores do |t|

      t.timestamps null: false
    end
  end
end
