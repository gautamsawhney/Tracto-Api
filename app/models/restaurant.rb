class Restaurant < ApplicationRecord

  # Autocode: Callbacks
    
  # Autocode: Relationships
  has_many :posts
      belongs_to :user
  
  # Autocode: Accept Nested Attributes

  # File Upload

  # Autocode: Validations
  validates_presence_of :name

	# Soft Destroy

end
