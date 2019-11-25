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

# # # users controller for CONSULTING HUB *** COMMENTED OUT BFR INTEGRATION
# class UsersController < ApplicationController
#   before_action :find_service, only: [:destroy]

#   def new
#     @user = User.new
#   end

#   def edit_offered_service
#     @user = current_user
#     authorize @user
#   end

#   def remove_offered_service
#     @user = current_user
#     authorize @user
#     offered_service = find_service
#     offered_service.destroy
#     redirect_to '/user/services'
#   end

#   private

#   def find_service
#     @service = Service.find(params[:id])
#   end
# end
