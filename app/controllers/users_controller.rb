class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @soc_networks = SocNetwork.all
    @users = User.all
  end
end
