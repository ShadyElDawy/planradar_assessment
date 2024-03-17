# app/controllers/users_controller.rb

class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    # GET /users
    def index
      @users = User.all
    end
  
    # GET /users/1
    def show
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :mail, :send_due_date_reminder, :due_date_reminder_interval, :due_date_reminder_time, :time_zone)
    end
  end
  