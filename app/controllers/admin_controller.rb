class AdminController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    redirect_to admin_users_path
  end
end
