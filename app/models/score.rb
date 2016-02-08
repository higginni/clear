class Score < ActiveRecord::Base
	
	has_attached_file :image, styles: { large: "500x500>",medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	belongs_to :user

  	validates_numericality_of :strokes, :only_integer => true, :greater_than_or_equal_to => 59
  	
end
