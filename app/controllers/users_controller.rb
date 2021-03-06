class UsersController < ApplicationController
    def new
    @user = User.new
    end

    def create
       user_params
          if @user.save
           flash[:notice] = "Welcome to Bloccit #{@user.name}!"
           create_session(@user)
           redirect_to root_path
         else
           flash.now[:alert] = "There was an error creating your account. Please try again."
           render :new
         end
    end

    def confirm
       user_params
    end

    def show
       @user = User.find(params[:id])
       @posts = @user.posts.visible_to(current_user)
    end

    private

    def user_params
       @user = User.new
       @user.name = params[:user][:name]
       @user.email = params[:user][:email]
       @user.password = params[:user][:password]
       @user.password_confirmation = params[:user][:password_confirmation]
     end
 end
