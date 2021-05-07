class ScenesController < ApplicationController
  before_action :get_scenario
  before_action :set_scene, only: %i[ show edit update destroy ]
  
  # GET /scenes or /scenes.json
  def index
    @scenes = @scenario.scenes
  end

  # GET /scenes/1 or /scenes/1.json
  def show
  end

  # GET /scenes/new
  def new
    @scene = @scenario.scenes.build
  end

  # GET /scenes/1/edit
  def edit
  end

  # POST /scenes or /scenes.json
  def create
    @scene = @scenario.scenes.build(scene_params)

    respond_to do |format|
      if @scene.save
        format.html { redirect_to scenario_scenes_path(@scenario), notice: "Scene was successfully created." }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1 or /scenes/1.json
  def update
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to scenario_scenes_path(@scenario), notice: "Scene was successfully updated." }
        format.json { render :show, status: :ok, location: @scene }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenes/1 or /scenes/1.json
  def destroy
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to scenario_scenes_path(@scenario), notice: "Scene was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def get_scenario
    @scenario = Scenario.find(params[:scenario_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = @scenario.scenes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scene_params
      params.require(:scene).permit(:title, :image, :number, :description, :when, :scenario_id)
    end
    
end
