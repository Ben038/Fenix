class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    unless current_user.nil?
      redirect_to pages_path
    end
  end

  def index
    checked_data #to keep the checkboxes checked after submit
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
      @data_process[year] = create_grouped_hash_by_year({year => values})
    end
  end

  def order_by_balance_year
    @params = params[:balance_year].values.sort
  end

  def commissions
    #method applicable to the commissions visualization
    checked_data
    filter_data
    ungrouped_set
    subgroup_data
    # step 4: check if more than one selection
    # step 5: it takes all data
      ungrouped_set
      # step 6: split by group_by will feed array, and add keys
      @data_process = {}
      # step 7: iterate over filtered data, eg 2017, 2018
      @data_rows_grouped_country.each do |country, values|
      # step 7: for each eg year, create a hash and push it in data_process array

      @data_process[country] = create_grouped_hash_by_country({country => values})
    end
  end

  def claims
    #method applicable to the claims visualization
    commissions
  end

  def share_page_with_options
    shared_url = params[:shared_url]
    receiver = User.find(params[:user_id])
    sender = current_user

    UserMailer.with(sender: sender, receiver: receiver, shared_url: shared_url).welcome.deliver_now
  end


  private

  def subgroup_data
    # ref 3: runs in parrallel with step 2 ungrouped_set, it takes the data_rows from filter_data (full set) and calculates subset
    # (eg, 2016, 2017 is selected, it will show total for 2016 and total for 2017)
    @data_rows_grouped_year = @data_rows.group_by(&:balance_year)
    @data_rows_grouped_network = @data_rows.group_by(&:reinsurance_network)
    @data_rows_grouped_country = @data_rows.group_by(&:country)
    @data_rows_grouped_risk = @data_rows.group_by(&:risk)
  end

  def checked_data
    @checked_years = params[:balance_year].present? ? parse_array_params(params[:balance_year]) : ""
    @checked_countries = params[:country].present? ? parse_array_params(params[:country]) : ""
    @checked_networks = params[:reinsurance_network].present? ? parse_array_params(params[:reinsurance_network]) : ""
    @checked_risks = params[:risk].present? ? parse_array_params(params[:risk]) : ""
    @checked_values = {
      balance_year: @checked_years,
      country: @checked_countries,
      reinsurance_network: @checked_networks,
      risk: @checked_risks
    }
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
    if @data_rows == []
      @data_rows_empty = "NO DATA FOUND"
    else
      @data_rows_empty = "data found"
    end
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

  def create_grouped_hash_by_year(hash)
    # ref 7: create a hash to be able to group by, eg 2017, does calculation for all data for that year which will be fed to subgroup_data
    {
      :commission_ratio => { label: "Commission Ratio", value: AccountingDatum.kpi_ratio_commissions(hash.values.first) },
      :balance_ratio => { label: "Balance Ratio", value: AccountingDatum.kpi_ratio_tech_bal(hash.values.first) },
      :claim_ratio => { label: "Claims Ratio", value: AccountingDatum.kpi_ratio_claims(hash.values.first) },
      :broker_comm_ratio => { label: "Broker Comm Ratio", value: AccountingDatum.broker_ratio_commissions(hash.values.first) },
      :reins_comm_ratio => { label: "Reinsurance Comm Ratio", value: AccountingDatum.reins_comm_ratio(hash.values.first) },
      :premium => { label: "Premium", value: AccountingDatum.calc_premium(hash.values.first) },
      :earned_premium => { label: "Earned Premium", value: AccountingDatum.calc_earned_premium(hash.values.first) },
      :premium_and_reserves_change => { label: "Premium & Res Change", value: AccountingDatum.calc_premium_and_reserves_change(hash.values.first) },
      :claim_paid => { label: "Claims Paid", value: AccountingDatum.calc_claim_paid(hash.values.first) },
      :claim_paid_and_reserves_change => { label: "Claims & Res Change", value: AccountingDatum.calc_claim_paid_and_reserves_change(hash.values.first) },
      :reinsurance_comm => { label: "Reinsurance Comm", value: AccountingDatum.calc_reinsurance_comm(hash.values.first) },
      :broker_comm => { label: "Broker Comm", value: AccountingDatum.calc_broker_comm(hash.values.first) },
      :profit_sharing => { label: "Profit Sharing", value: AccountingDatum.calc_profit_sharing(hash.values.first) },
      :taxes => { label: "Taxes", value: AccountingDatum.calc_taxes(hash.values.first) },
      :interests => { label: "Interests", value: AccountingDatum.calc_interests(hash.values.first) },
      :balance => { label: "Balance", value: AccountingDatum.calc_balance(hash.values.first) }
    }
  end

  def create_grouped_hash_by_country(hash)
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
    returning_array # [" Italy"]
  end
end

# pages controller for CONSULTING HUB *** COMMENTED OUT BFR INTEGRATION

# class PagesController < ApplicationController
#   skip_before_action :authenticate_user!, only: :home

#   def profile
#     current_user
#   end

#   def sent_requests
#     @service_requests = current_user.sent_requests
#   end

#   def received_requests
#     @service_requests = current_user.service_requests
#   end

#   def services
#     @services = current_user.services
#   end

#   def service
#     @service = current_user.services
#   end

#   def home
#     @services = Service.all
#   end
# end
