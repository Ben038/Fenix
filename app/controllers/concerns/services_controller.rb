# # # services requests controller for CONSULTING HUB *** COMMENTED OUT BFR INTEGRATION

# class ServicesController < ApplicationController
#   skip_before_action :authenticate_user!, only: [:index, :show]

#   skip_after_action :verify_authorized, except: [:index], unless: :skip_pundit?
#   skip_after_action :verify_policy_scoped, only: [:index, :update, :create, :new, :edit], unless: :skip_pundit?


#   def new
#     @service = Service.new
#     authorize @service
#   end

#   def index
#     # category = "Renewal"
#     if params[:query]
#       @services = Service.search(params[:query])
#       # @services = Service.search(params[:query], where: { _and: [{category: category}]})
#     else
#       @services = Service.all
#     end
#     # TO DO: the below is currently not working. To get the homepage working, we are back to the above service.all.
#     # @services = Service.where.not(user_id: current_user.id)
#   end

#   def show
#     @service = Service.find(params[:id])
#     authorize @service
#   end

#   def create
#     @service = Service.new(service_params)
#     @service.user = current_user
#     authorize @service
#     if @service.save
#       redirect_to service_path(@service)
#     else
#       render :new
#     end
#   end

#   def update
#     @service = Service.find(params[:id])
#     if @service.update(service_params)
#       authorize @service
#       redirect_to user_services_path
#     else
#       render :edit
#     end
#   end

#   def edit
#     @service = Service.find(params[:id])
#     authorize @service
#   end

#   private

#   def service_params
#     params.require(:service).permit(:picture_url, :name, :description, :rate_per_day, :category, :address)
#   end
# end

