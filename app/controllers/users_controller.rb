class UsersController < ApplicationController

    def index

    end

    def new 
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            # binding.pry
            session[:user_id] = @user.id 
            redirect_to users_path(@user)
        else
            redirect_to new_users_path
        end
    end
     
      private
     
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
    


end