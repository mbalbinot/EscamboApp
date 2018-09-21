class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category

  # Active Storage
  has_one_attached :picture

  # RubyMoney - Money-Rails
  monetize :price_cents

  # Validates
  validates_presence_of :title, :description, :category, :price

  # Scopes
  scope :descending_order, -> (quantity = 9) {limit(quantity).order(created_at: :desc)}
  scope :member_ads, -> (member) {where(member: member)}
end
