class ScenariosController < ApplicationController
  before_action :set_scenario, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only:
  [:new, :create, :update, :edit, :destroy]

  # GET /scenarios or /scenarios.json
  def index
    @scenarios = Scenario.all
  end

  # GET /scenarios/1 or /scenarios/1.json
  def show
    @user = @scenario.user
  end

  # GET /scenarios/new
  def new
    @scenario = Scenario.new
  end

  # GET /scenarios/1/edit
  def edit
  end

  # POST /scenarios or /scenarios.json
  def create
    @scenario = Scenario.new(scenario_params)
    @scenario.user = current_user

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to @scenario, notice: "Scenario was successfully created." }
        format.json { render :show, status: :created, location: @scenario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenarios/1 or /scenarios/1.json
  def update
    respond_to do |format|
      if @scenario.update(scenario_params)
        format.html { redirect_to @scenario, notice: "Scenario was successfully updated." }
        format.json { render :show, status: :ok, location: @scenario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1 or /scenarios/1.json
  def destroy
    @scenario.destroy
    respond_to do |format|
      format.html { redirect_to scenarios_url, notice: "Scenario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scenario_params
      params.require(:scenario).permit(:title, :image, :description, :start, :end)
    end
end
