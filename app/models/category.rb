class Category < ApplicationRecord
  # Associations
  has_many :ads

  # Validations
  validates_presence_of(:description)
end
