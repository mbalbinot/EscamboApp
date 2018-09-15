class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category

  # Active Storage
  has_one_attached :picture

  # RubyMoney - Money-Rails
  monetize :price_cents
end
