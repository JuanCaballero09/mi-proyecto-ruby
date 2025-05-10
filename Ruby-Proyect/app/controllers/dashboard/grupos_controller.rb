class Dashboard::GruposController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin 

    def index
      @grupos = Grupo.all
    end
    
    def new
      @grupo = Grupo.new
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

    private

    def grupo_params
      params.require(:grupo).permit(:nombre)
    end
  
    def check_admin
      unless current_user.admin?
        redirect_to root_path, alert: "No tienes acceso a esta página."
      end
    end

end
