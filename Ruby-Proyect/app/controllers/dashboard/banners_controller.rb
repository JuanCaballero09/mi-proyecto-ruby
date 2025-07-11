class Dashboard::BannersController < ApplicationController
   def index
    @banner = Banner.new
    @banners = Banner.all
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.save
  end

  def destroy
    banner = Banner.find(params[:id])
    banner.destroy
  end

  private

  def banner_params
    params.require(:banner).permit(:image)
  end
end
