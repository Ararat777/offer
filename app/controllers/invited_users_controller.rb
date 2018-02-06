class InvitedUsersController < ApplicationController
  def create
    @soc_network = SocNetwork.find(permitted_params[:soc_id])
    if @user = @soc_network.invited_users.find_by(:link => permitted_params[:link],:status => 'unconfirmed')
      @user.status = 0
      @user.save
      simple_respond
    else
      @user = @soc_network.invited_users.new(:link => permitted_params[:link], :user_id => current_user.id)
      if @user.save
         simple_respond
      else
         @error = @user.errors
         simple_respond
      end
    end
  end
  
  private
  def permitted_params
    params.require(:invited_user).permit(:soc_id,:link)
  end
  def simple_respond
    respond_to do |format|
      format.js {}
    end
  end
end
