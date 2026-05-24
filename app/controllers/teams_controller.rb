class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]
  before_action :redirect_if_logged_out, only: [:new]
  before_action :user_already_have_team, only: [:create]
  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    if user_already_have_team
      flash.now[:alert] = "Você ja pertence a um time!"
      render :new, status: :unprocessable_entity
      return
    end

    @team = Team.new(team_params) 

    @team.user = current_user
    

    respond_to do |format|
      if @team.save
        current_user.update(team: @team)
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @team.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @team.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy!

    respond_to do |format|
      format.html { redirect_to teams_path, notice: "Team was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def redirect_if_logged_out
      if !user_signed_in?
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name)
    end

    def user_already_have_team
      if current_user.team != nil
        true
      else
        false
      end
    end
end
