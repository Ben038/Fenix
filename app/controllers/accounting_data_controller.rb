class AccountingDataController < ApplicationController
  def create
    authorize @accounting_data
  end

  def new
    @accounting_data = AccountingData.new
  end

  def index
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
