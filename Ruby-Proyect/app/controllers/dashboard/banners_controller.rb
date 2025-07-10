class Dashboard::BannersController < ApplicationController
  def index
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save 
      redirect_to_dashboard_banners_path, notice: 'Imagen agregada con exito.'
    else
      redirect_to_dashboard_banners_path, alert: 'Error al agregar la imagen.'
    end
  end

  def destroy
  end
end
