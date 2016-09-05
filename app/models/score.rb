class Score < ActiveRecord::Base
	# allows for image to be attached
	has_attached_file :image, styles: { large: "500x500>",medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    # gives the user attribute the scores
  	belongs_to :user
    # ensures scores can only be 55+ 
  	# validates_numericality_of :strokes, :only_integer => true, :greater_than_or_equal_to => 55

  	# searchkick
  	
end
