class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def show
    end
    def index

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

    end

    def destroy

    end
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password)
  end
end
