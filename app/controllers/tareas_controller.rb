class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :update, :destroy]
  before_action :authenticate_usuario


  # GET /tareas
  def index
    @tareas = Tarea.all

    render json: @tareas
  end

  # GET /tareas/1
  def show
    render json: @tarea
  end

  # POST /tareas
  def create
    @tarea = Tarea.new(tarea_params)

    if @tarea.save
      render json: @tarea, status: :created, location: @tarea
    else
      render json: @tarea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tareas/1
  def update
    if @tarea.update(tarea_params)
      render json: @tarea
    else
      render json: @tarea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tareas/1
  def destroy
    @tarea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tarea_params
      params.require(:tarea).permit(:titulo, :finalizada)
    end
end
