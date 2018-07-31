class StaticPagesController < ApplicationController
  skip_before_action :user_signed_in?
  def home
    if user_signed_in?
      redirect_to user_path
    end
  end
end
