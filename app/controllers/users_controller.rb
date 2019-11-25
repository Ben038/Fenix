class UsersController < ApplicationController
  before_action :find_international_client

  # this is a B2B approach and the user buy the product shall not be creating
  # its own access to the platform. A platform admin will create the credentials for each user to
  # make sure the access will be granted only to the dedicated environment
  # for the multinational company

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  private

  def find_international_client
    @international_client = InternationalClient.find(params[:id])
  end
end
