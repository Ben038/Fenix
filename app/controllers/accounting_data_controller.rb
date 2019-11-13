class AccountingDataController < ApplicationController
  def create
    authorize @accounting_data
  end

  def new
    @accounting_datum = AccountingDatum.new
  end

  def index
    @accounting_data = AccountingDatum.all
  end

  def import
    AccountingDatum.import(params[:file])
    redirect_to accounting_data_path
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
  end
end
