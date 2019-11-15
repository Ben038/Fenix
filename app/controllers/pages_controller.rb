class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # step 1: when arriving on dashboard, call filter_data (takes only data for specific user + looks if there is a selection done)
    filter_data
    # step 2: when filter_data is done, it goes to ungrouped_set (does computations for full set)
    ungrouped_set
    # step 3: when more than one selection, it calculates the subset
    subgroup_data
    # step 4: check if more than one selection
      # step 5: it takes all data
        ungrouped_set
        # step 6: split by group_by will feed array, and add keys
        @data_process = {}
        # step 7: iterate over filtered data, eg 2017, 2018
        @data_rows_grouped_year.each do |year, values|
        # step 7: for each eg year, create a hash and push it in data_process array

        @data_process[year] =  create_grouped_hash({year => values})
  end
  end

  # @data_process[0].premium

  private

  def subgroup_data
    # ref 3: runs in parrallel with step 2 ungrouped_set, it takes the data_rows from filter_data (full set) and calculates subset
    # (eg, 2016, 2017 is selected, it will show total for 2016 and total for 2017)
    @data_rows_grouped_year = @data_rows.group_by(&:balance_year)
    @data_rows_grouped_network = @data_rows.group_by(&:reinsurance_network)
  end

  def filter_data
    # ref 1: this method first prefilters data and only show data submitted by user or other user from same client
    @data_rows = current_user.international_client.accounting_data.includes(:file_upload)
    # first check wether there is a selection done in the sidebar, by checking if there are params present
    # if no selections are made, this method skips the @data_rows code below
    # when this method is done, go back to index method
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
    # ref 2: this method calculates all accounting calculations on @data_rows (if no selection is made in sidebar,
    # it takes the full dataset (first @data_rows in the filter_data method))
    # (eg, 2016, 2017 is selected, it will show total for 2016 and 2017 together)
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

    # ref 7: create a hash to be able to group by, eg 2017, does calculation for all data for that year which will be fed to subgroup_data
      {
        :commission_ratio => AccountingDatum.kpi_ratio_commissions(hash.values.first),
        :balance_ratio => AccountingDatum.kpi_ratio_tech_bal(hash.values.first),
        :claim_ratio => AccountingDatum.kpi_ratio_claims(hash.values.first),
        :broker_comm_ratio => AccountingDatum.broker_ratio_commissions(hash.values.first),
        :reins_comm_ratio => AccountingDatum.reins_comm_ratio(hash.values.first),
        :premium => AccountingDatum.calc_premium(hash.values.first),
        :earned_premium => AccountingDatum.calc_earned_premium(hash.values.first),
        :claim_paid => AccountingDatum.calc_claim_paid(hash.values.first),
        :claim_paid_and_reserves_change => AccountingDatum.calc_claim_paid_and_reserves_change(hash.values.first),
        :premium_and_reserves_change => AccountingDatum.calc_premium_and_reserves_change(hash.values.first),
        :reinsurance_comm => AccountingDatum.calc_reinsurance_comm(hash.values.first),
        :broker_comm => AccountingDatum.calc_broker_comm(hash.values.first),
        :profit_sharing => AccountingDatum.calc_profit_sharing(hash.values.first),
        :taxes => AccountingDatum.calc_taxes(hash.values.first),
        :interests => AccountingDatum.calc_interests(hash.values.first),
        :balance => AccountingDatum.calc_balance(hash.values.first)
    }

end

def parse_array_params(concerned_params)
      #  "country" =>> [ { "Italy"  =>>  "1"}, {"Greece" => "0"}]
      returning_array = []
      concerned_params.each do |element|
        returning_array << element.first
      end
    # [" Italy"]
    returning_array
  end

  def premium_bar_chart
    filter_data
    @premium
    AccountingDatum.balance_year
    @data_rows = @data_rows.where balance_year: params[:balance_year] if params[:balance_year].present?
  end
end
