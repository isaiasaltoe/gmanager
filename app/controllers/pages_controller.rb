class PagesController < ApplicationController

  before_action :redirect_if_logged_in, only: [:home]
  before_action :redirect_if_logged_out, only: [:lobby]

  def home

  end

  def lobby
  end

  private

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to lobby_path
    end
  end

  def redirect_if_logged_out
    if !user_signed_in?
      redirect_to root_path 
    end
  end
end
