class UsersController < ApplicationController
  before_action :find_international_client

# this is a B2B approach and the user buy the product shall not be creating
# its own access to the platform. A platform admin will create the credentials for each user to
# make sure the access will be granted only to the dedicated environment
# for the multinational company

  def new
    @user = User.new
  end

  # def create
  # end

  # def index
  # end

  # def destroy
  # end

  # def show
  # end

  # def edit
  # end

  # def update
  # end

  private

  def find_international_client
    @international_client = InternationalClient.find(params[:id])
  end
end

# CODE FROM FINCONSULT NOT NEEDED YET

  # def edit_offered_service
  #   @user = current_user
  #   authorize @user
  # end

  # def remove_offered_service
  #   @user = current_user
  #   authorize @user
  #   offered_service = find_service
  #   offered_service.destroy
  #   redirect_to '/user/services'
  # end
