class MainprojectsController < ApplicationController
  before_action :set_mainproject, only: [:show, :edit, :update, :destroy]

  # GET /mainprojects
  # GET /mainprojects.json
  def index
    @mainprojects = Mainproject.all
  end

  # GET /mainprojects/1
  # GET /mainprojects/1.json
  def show
  end

  # GET /mainprojects/new
  def new
    @mainproject = Mainproject.new
  end

  # GET /mainprojects/1/edit
  def edit
  end

  # POST /mainprojects
  # POST /mainprojects.json
  def create
    @mainproject = Mainproject.new(mainproject_params)
    @mainproject.user_id = current_user.id

    respond_to do |format|
      if @mainproject.save
        format.html { redirect_to @mainproject, notice: 'El proyecto ha sido creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @mainproject }
      else
        format.html { render :new }
        format.json { render json: @mainproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mainprojects/1
  # PATCH/PUT /mainprojects/1.json
  def update
    respond_to do |format|
      if @mainproject.update(mainproject_params)
        format.html { redirect_to @mainproject, notice: 'El proyecto ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @mainproject }
      else
        format.html { render :edit }
        format.json { render json: @mainproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainprojects/1
  # DELETE /mainprojects/1.json
  def destroy
    @mainproject.destroy
    respond_to do |format|
      format.html { redirect_to mainprojects_url, notice: 'Mainproject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mainproject
      @mainproject = Mainproject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mainproject_params
      params.require(:mainproject).permit(:company, :name, :user_id)
    end
end
