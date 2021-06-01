class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path, notice: 'User was successfully created.' }
      else
        render :new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path, notice: 'User was successfully updated.' }
      else
        render :edit
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_path, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def user_params
      params.require(:user).permit(:email,:password,:name)
    end
end
