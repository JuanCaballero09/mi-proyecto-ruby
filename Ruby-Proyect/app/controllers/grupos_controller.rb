class GruposController < ApplicationController
  before_action :set_grupo, only: %i[ show ]

  # GET /grupos or /grupos.json
  def index
    @grupos = Grupo.order(:id)
  end

  # GET /grupos/1 or /grupos/1.json
  def show
  end

  def dashboard
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end
end
