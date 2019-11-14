class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :create_select_options

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
