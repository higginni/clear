class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :strokes
      t.string :course

      t.timestamps null: false
    end
  end
end
