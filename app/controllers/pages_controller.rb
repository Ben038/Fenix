class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def filter_data
    @data_rows = current_user.international_client.accounting_data
    @data_rows = @data_rows.where balance_year: params[:balance_year] if params[:balance_year].present?
    @data_rows = @data_rows.where local_insurer: params[:local_insurer] if params[:local_insurer].present?
    @data_rows = @data_rows.where geo_area: params[:geo_area] if params[:geo_area].present?
    @data_rows = @data_rows.where country: params[:country] if params[:country].present?
    @data_rows = @data_rows.where business_division: params[:business_division] if params[:business_division].present?
    @data_rows = @data_rows.where local_client: params[:local_client] if params[:local_client].present?
    @data_rows = @data_rows.where reinsurance_network: params[:reinsurance_network] if params[:reinsurance_network].present?
    @data_rows = @data_rows.where risk: params[:risk] if params[:risk].present?
    @data_rows = @data_rows.where quarter: params[:quarter] if params[:quarter].present?
  end
end

