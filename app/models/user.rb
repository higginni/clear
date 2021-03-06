class User < ActiveRecord::Base
  include Clearance::User

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # means every user owns more than one score. 
  has_many :scores
  
end