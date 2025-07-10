class Dashboard::BannersController < ApplicationController
  def index
  end

  def create
    @banner = Banner.new
    @banner.save 
  end

  def destroy
  end
end
