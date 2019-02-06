class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  def new
    @user = User.new
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 12)
  end

  def index
    @user = User.paginate(page: params[:page], per_page: 12)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Asf Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been edited successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])

  end
end