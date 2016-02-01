class AddAttachmentImageToScores < ActiveRecord::Migration
  def self.up
    change_table :scores do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :scores, :image
  end
end
