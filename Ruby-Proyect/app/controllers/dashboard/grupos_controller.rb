class Dashboard::GruposController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :check_admin

  def index
    @grupos = Grupo.order(:id)
  end

  def new
    @grupo = Grupo.new
  end

  def edit
    @grupo = Grupo.find(params[:id])
  end

  def destroy
    @grupo = Grupo.find(params[:id])
    @grupo.destroy
    redirect_to dashboard_grupos_path, notice: "Grupo eliminado exitosamente."
  end


  def create
    @grupo = Grupo.new(grupo_params)
    if @grupo.save
      redirect_to dashboard_grupos_path,
      notice: "El grupo fue creado exitosamente."
    else
      render :new
    end
  end

  def update
    @grupo = Grupo.find(params[:id])
    if @grupo.update(grupo_params)
      redirect_to dashboard_grupos_path, notice: "Grupo actualizado exitosamente."
    else
      render :edit
    end
  end



  private

  def set_grupo
    @grupo = Grupo.find(params[:id])
  end

  def grupo_params
    params.require(:grupo).permit(:nombre, :descripcion, :imagen)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "No tienes acceso a esta página."
    end
  end
end
