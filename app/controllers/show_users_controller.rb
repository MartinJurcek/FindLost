class ShowUsersController < ApplicationController
  def index 
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to stuffs_url, notice: 'User was successfuly deleted.' }
      format.json { head :no_content }
    end
  end
end