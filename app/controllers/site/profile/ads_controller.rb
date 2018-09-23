class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: [:edit, :update]
  before_action :get_categories, only: [:new, :edit, :create]

  def index
    @ads = Ad.member_ads(current_member)
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_ad)
    @ad.member = current_member

    if @ad.save
      redirect_to site_profile_ads_path, notice: t('messages.created')
    else
      render :new
    end
  end

  def edit
    #
  end

  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: t('messages.updated')
    else
      render :edit
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def get_categories
    @categories = Category.all
  end

  def params_ad
    params.require(:ad).permit(:id, :title, :description, :category_id, :price, :picture, :finish_date)
  end
end
