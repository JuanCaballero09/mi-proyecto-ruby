class Dashboard::DashboardController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :check_admin


  def index
    load_charts_data
  end

  private

  def check_admin
    unless current_user.admin? # Verifica si el usuario tiene rol admin
      redirect_to root_path, alert: "No tienes acceso a esta página." # Redirige si no es admin
    end
  end

  def load_charts_data
    @products_by_group = Product.joins(:grupo).group('grupos.nombre').count
    @grupos_growth = Grupo.group_by_month(:created_at, format: "%b %Y").count
  end

end
