class InvitedUsersController < ApplicationController
  def create
    @soc_network = SocNetwork.find(permitted_params[:soc_id])
    if @user = @soc_network.invited_users.find_by(:link => permitted_params[:link],:status => 'unconfirmed')
      @user.status = 0
      @user.save
      redirect_to cabinet_path
    else
      @user = @soc_network.invited_users.new(:link => permitted_params[:link], :user_id => current_user.id)
      if @user.save
        redirect_to cabinet_path
      else
         @soc_networks = SocNetwork.all
         @users = User.all
        render 'users/show'
      end
    end
  end
  
  private
  def permitted_params
    params.require(:invited_user).permit(:soc_id,:link)
  end
end
