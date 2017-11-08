class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Register success"
      redirect_to users_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end
  def edit
    @user =User.find_by id: params[:id]
  end
  def update
     respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
def show
    @user = User.find_by id: params[:id]
  end
  private
  def user_params
    params.require(:user).permit :name, :password, :password_confirmation
  end
  private
  def set_user
      @user = User.find(params[:id])
    end   
end
