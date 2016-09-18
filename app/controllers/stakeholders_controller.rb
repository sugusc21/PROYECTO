class StakeholdersController < ApplicationController
  def index
  @mainproject = Mainproject.find(params[:mainproject_id])
  @stakeholders = @mainproject.stakeholders
  end

  def new
  @mainproject = Mainproject.find(params[:mainproject_id])
  @stakeholder = @mainproject.stakeholders.build
  end

  def create
  @mainproject = Mainproject.find(params[:mainproject_id])
  @stakeholder = Stakeholder.new(stakeholder_params)
  @stakeholder.mainproject = @mainproject
  respond_to do |format|
      if @stakeholder.save
        format.html { redirect_to [@mainproject, @stakeholder], notice: 'El stakeholder se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @stakeholder }
      else
        format.html { render :new }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @mainproject = Mainproject.find(params[:id])
    @stakeholder = Stakeholder.find(params[:id])
    respond_to do |format|
      if @stakeholder.update(stakeholder_params)
        format.html { redirect_to [@mainproject, @stakoholder], notice: 'El stakeholder se ha actualizado.' }
        format.json { render :show, status: :ok, location: @stakeholder }
      else
        format.html { render :edit }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @mainproject = Mainproject.find(params[:id])
    @stakeholder = Stakeholder.find(params[:id])
  end

  def destroy
  @stakeholder.destroy
    respond_to do |format|
      format.html { redirect_to mainproject_stakeholder_path(@mainproject), notice: 'El stakeholder se ha borrado.' }
      format.json { head :no_content }  
  end
end

  def show
    @mainproject = Mainproject.find(params[:id])
    @stakeholder = Stakeholder.find(params[:id])
  end

  def process_stakeholders
    @mainproject = Mainproject.find(params[:id])
    @stakeholder = Stakeholder.find(params[:id])
  end

private
    # Use callbacks to share common setup or constraints between actions.
  def set_stakeholder
      @stakeholder = Stakeholder.find(params[:id])
      @mainproject = Mainproject.find(params[:mainproject_id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stakeholder_params
      params.require(:stakeholder).permit(:name, :jobtitle, :busarea, :mainproject_id)
    end
end
