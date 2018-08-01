class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    profile
  end

  def update
    if profile.update_attributes(profile_params)
      flash[:success] = "You have successfully edited your profile."
      redirect_to profile_path
    else
      flash[:notice] = "Something went wrong saving your changes."
      render :edit
    end
  end

  def show
    profile
  end

  private

  def profile_params #add ability to change first_name, last_name, email, avatar
    params.require(:profile).permit(:birthday, :gender, :location, :avatar)
  end

  def profile
    @profile ||= User.find(params[:id]).profile
  end
end
