class Comment < ApplicationRecord

  # Autocode: Callbacks
    # Autocode: Relationships
  belongs_to :user
  belongs_to :post
    # Autocode: Accept Nested Attributes

  # File Upload

  # Autocode: Validations
  validates_presence_of :body

  # Soft Destroy

end
