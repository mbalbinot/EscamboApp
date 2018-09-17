class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = Ad.member_ads(current_member)
  end
end
