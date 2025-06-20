class Dashboard::DashboardController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :check_admin


  def index
  end

  private

  def check_admin
    unless current_user.admin? # Verifica si el usuario tiene rol admin
      redirect_to root_path, alert: "No tienes acceso a esta página." # Redirige si no es admin
    end
  end
end
