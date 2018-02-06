class SocUserLinksController < ApplicationController
  def create
     @soc_network = SocNetwork.find(permitted_params[:soc_id])
    if @user = @soc_network.soc_user_links.find_by(:link => permitted_params[:link],:status => 'unconfirmed')
      @user.status = 0
      @user.save
      simple_respond
    else
      @user = @soc_network.soc_user_links.new(:link => permitted_params[:link], :user_id => current_user.id)
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
    params.require(:soc_user_link).permit(:soc_id,:link)
  end
  def simple_respond
    respond_to do |format|
      format.js {}
    end
  end
end
