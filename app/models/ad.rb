class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category, counter_cache: true

  # Active Storage
  has_one_attached :picture
  has_many :comments

  # RubyMoney - Money-Rails
  monetize :price_cents

  # Validates
  validates :title, :description, :category, :price, presence: true
  validates :price, numericality: { greater_than: 0}

  # Scopes
  scope :descending_order, -> (quantity = 9) {limit(quantity).order(created_at: :desc)}
  scope :member_ads, -> (member) {where(member: member)}
  scope :by_category, -> (id) {where(category: id)}
  scope :search, -> (term) {where("lower(title) LIKE ?", "%#{term.downcase}%")}
end
