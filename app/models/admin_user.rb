class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
  :recoverable, :rememberable, :trackable, :validatable

  # Autocode: Callbacks
  # Autocode: Relationships
  # Autocode: Accept Nested Attributes

  # File Upload

  # Autocode: Validations

  # Soft Destroy

end
