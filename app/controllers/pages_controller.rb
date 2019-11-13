class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    filter_data
    @commission_ratio = AccountingDatum.kpi_ratio_commissions(@data_rows)
    @balance_ratio = AccountingDatum.kpi_ratio_tech_bal(@data_rows)
    @claim_ratio = AccountingDatum.kpi_ratio_claims(@data_rows)
    @broker_comm_ratio = AccountingDatum.broker_ratio_commissions(@data_rows)
    @reins_comm_ratio = AccountingDatum.reins_comm_ratio(@data_rows)
    @premium = AccountingDatum.calc_premium(@data_rows)
    @earned_premium = AccountingDatum.calc_earned_premium(@data_rows)
    @claim_paid = AccountingDatum.calc_claim_paid(@data_rows)
    @claim_paid_and_reserves_change = AccountingDatum.calc_claim_paid_and_reserves_change(@data_rows)
    @premium_and_reserves_change = AccountingDatum.calc_premium_and_reserves_change(@data_rows)
    @reinsurance_comm = AccountingDatum.calc_reinsurance_comm(@data_rows)
    @broker_comm = AccountingDatum.calc_broker_comm(@data_rows)
    @profit_sharing = AccountingDatum.calc_profit_sharing(@data_rows)
    @taxes = AccountingDatum.calc_taxes(@data_rows)
    @interests = AccountingDatum.calc_interests(@data_rows)
    @balance = AccountingDatum.calc_balance(@data_rows)
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
