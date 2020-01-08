class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :create_select_options

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def create_select_options
    @select_years ||= AccountingDatum.all.pluck(:balance_year).uniq
    @select_countries ||= AccountingDatum.all.pluck(:country).uniq
    @select_networks ||= AccountingDatum.all.pluck(:reinsurance_network).uniq
    @select_risks ||= AccountingDatum.all.pluck(:risk).uniq
    @select_local_insurers ||= AccountingDatum.all.pluck(:local_insurer).uniq
    @select_geo_area ||= AccountingDatum.all.pluck(:geo_area).uniq
    @select_business_div ||= AccountingDatum.all.pluck(:business_division).uniq
    @select_local_clients ||= AccountingDatum.all.pluck(:local_client).uniq
    @select_quarter ||= AccountingDatum.all.pluck(:quarter).uniq
  end
end

# application controller for CONSULTING HUB *** COMMENTED OUT BFR INTEGRATION

# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   include Pundit

#   # Pundit: white-list approach.
#   after_action :verify_authorized, except: :index, unless: :skip_pundit?
#   after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

#   # Uncomment when you *really understand* Pundit!
#   # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
#   # def user_not_authorized
#   #   flash[:alert] = "You are not authorized to perform this action."
#   #   redirect_to(root_path)
#   # end

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profile_picture])
#   end
# # CHECK IF NECESSARY
#   def user_params
#     params.require(:user).permit(:profile_picture)
#   end

#    private

#   def skip_pundit?
#     devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
#   end
# end
