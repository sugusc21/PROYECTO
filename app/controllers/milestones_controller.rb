class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  
  # GET /milestones
  # GET /milestones.json
  def index
    @mainproject = Mainproject.find(params[:mainproject_id])
    @milestones = Milestone.all
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
    @user = User.find(@milestone.users_id)
  end

  # GET /milestones/new
  def new
    @mainproject = Mainproject.find(params[:mainproject_id])
    @milestone = Milestone.new
  end

  # GET /milestones/1/edit
  def edit

  end

  # POST /milestones
  # POST /milestones.json
  def create
    @mainproject = Mainproject.find(params[:mainproject_id])
    @milestone = Milestone.new(milestone_params)
    @milestone.users_id = current_user.id

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to [@mainproject, @milestone], notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1
  # PATCH/PUT /milestones/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to [@mainproject, @milestone], notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to mainproject_milestones_path(@mainproject), notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
      @mainproject = Mainproject.find(params[:mainproject_id])

    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_params
      params.require(:milestone).permit(:milestone, :projtype, :duedate, :mainprojects_id, :users_id, :attachment)
    end
end
