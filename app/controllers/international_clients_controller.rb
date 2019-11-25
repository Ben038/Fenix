class InternationalClientsController < ApplicationController
  def new
    @international_client = InternationalClient.new
  end
end
