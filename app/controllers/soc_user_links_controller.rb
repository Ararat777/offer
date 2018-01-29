class SocUserLinksController < ApplicationController
  def create
    @soc_network = SocNetwork.find(permitted_params[:soc_id])
    @soc_network.soc_user_links.create(:link => permitted_params[:link], :user_id => current_user.id)
    redirect_to cabinet_path
  end
  
  private
  def permitted_params
    params.require(:soc_user_link).permit(:soc_id,:link)
  end
  
end
