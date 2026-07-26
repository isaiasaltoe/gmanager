class UserTeamController < ApplicationController
  def destroy
    current_user.leave_team
    redirect_to edit_user_registration_path, notice: "Você saiu da equipe com sucesso"
  end
end
