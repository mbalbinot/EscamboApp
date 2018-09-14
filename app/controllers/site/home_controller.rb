class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.order(:description)
    @ads = Ad.order(created_at: :desc).limit(6)
  end
end
