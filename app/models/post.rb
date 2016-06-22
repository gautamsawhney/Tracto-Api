class Post < ApplicationRecord

  # Autocode: Callbacks
    
  # Autocode: Relationships
  has_many :comments
      belongs_to :user
      belongs_to :restaurant
  
  # Autocode: Accept Nested Attributes

  # File Upload

  # Autocode: Validations

	# Soft Destroy

end
