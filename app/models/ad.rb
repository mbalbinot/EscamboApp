class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category

  # RubyMoney - Money-Rails
  monetize :price_cents
end
