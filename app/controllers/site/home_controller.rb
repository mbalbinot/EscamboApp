class Site::HomeController < SiteController
  def index
    @categories = Category.order(:description)
    @ads = Ad.order(created_at: :desc).limit(6)
  end
end
