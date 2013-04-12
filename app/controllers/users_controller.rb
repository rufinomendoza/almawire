class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Almawire!"
      redirect_to meet_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all#.where("university = ?", current_user.university).where("id != ?", current_user.id)
  end

  def roulette
    @meet_user = User.where("university = ?", current_user.university).where("id != ?", current_user.id).shuffle.first#Add form submission params
    if @meet_user
      redirect_to user_path(@meet_user)
    else
      redirect_to meet_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.university.chomp!
    @user.major.chomp!
    @user.industry.chomp!
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      # redirect_to @user
      redirect_to meet_path
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
