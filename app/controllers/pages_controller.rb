class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    filter_data
    ungrouped_set

    group_data
    # binding.pry
    if @grouped
      ungrouped_set
      @data_process = []
      @data_rows.each do |year_group_hash|
        @data_process << create_grouped_hash(year_group_hash)
      end
    else
    end
  end

  private

  def group_data
    @data_rows = @data_rows.group_by :balance_year && @grouped = true if params[:group_by].present?
  end

  def filter_data
    @data_rows = current_user.international_client.accounting_data
    @data_rows = @data_rows.where balance_year: parse_array_params(params[:balance_year]) if params[:balance_year].present?
    @data_rows = @data_rows.where local_insurer: parse_array_params(params[:local_insurer]) if params[:local_insurer].present?
    @data_rows = @data_rows.where geo_area: parse_array_params(params[:geo_area]) if params[:geo_area].present?
    @data_rows = @data_rows.where country: parse_array_params(params[:country]) if params[:country].present?
    @data_rows = @data_rows.where business_division: parse_array_params(params[:business_division]) if params[:business_division].present?
    @data_rows = @data_rows.where local_client: parse_array_params(params[:local_client]) if params[:local_client].present?
    @data_rows = @data_rows.where reinsurance_network: parse_array_params(params[:reinsurance_network]) if params[:reinsurance_network].present?
    @data_rows = @data_rows.where risk: parse_array_params(params[:risk]) if params[:risk].present?
    @data_rows = @data_rows.where quarter: parse_array_params(params[:quarter]) if params[:quarter].present?
  end

  def ungrouped_set
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

  def create_grouped_hash(hash)
    {hash.keys.first =>  {
      commission_ratio => AccountingDatum.kpi_ratio_commissions(hash.values.first),
      balance_ratio => AccountingDatum.kpi_ratio_tech_bal(hash.values.first),
      claim_ratio => AccountingDatum.kpi_ratio_claims(hash.values.first),
      broker_comm_ratio => AccountingDatum.broker_ratio_commissions(hash.values.first),
      reins_comm_ratio => AccountingDatum.reins_comm_ratio(hash.values.first),
      premium => AccountingDatum.calc_premium(hash.values.first),
      earned_premium => AccountingDatum.calc_earned_premium(hash.values.first),
      claim_paid => AccountingDatum.calc_claim_paid(hash.values.first),
      claim_paid_and_reserves_change => AccountingDatum.calc_claim_paid_and_reserves_change(hash.values.first),
      premium_and_reserves_change => AccountingDatum.calc_premium_and_reserves_change(hash.values.first),
      reinsurance_comm => AccountingDatum.calc_reinsurance_comm(hash.values.first),
      broker_comm => AccountingDatum.calc_broker_comm(hash.values.first),
      profit_sharing => AccountingDatum.calc_profit_sharing(hash.values.first),
      taxes => AccountingDatum.calc_taxes(hash.values.first),
      interests => AccountingDatum.calc_interests(hash.values.first),
      balance => AccountingDatum.calc_balance(hash.values.first),
    }
  }
  end

    def parse_array_params(concerned_params)
      #  "country" =>> [ { "Italy"  =>>  "1"}, {"Greece" => "0"}]
    returning_array = []
    concerned_params.each do |element|
      returning_array << element.first
    end
    # [" Italy"]
    binding.pry
    returning_array

  end

  def premium_bar_chart
    filter_data
    @premium
    AccountingDatum.balance_year
    @data_rows = @data_rows.where balance_year: params[:balance_year] if params[:balance_year].present?
  end
end
