class DriverPostController < ApplicationController
  def index
  end

  def show
    @driver_post = DriverPost.find(params[:id])
  end

  def destroy
  end
end
