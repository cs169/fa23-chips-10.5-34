# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index
    @campaign_finance = CampaignFinance.all
  end

  def search
    cycle = params[:cycle]
    category = params[:category]
    api_key = ENV['PROPUBLICA_API_KEY']
    service = CampaignFinance.initialize(api_key)
    result = service.propublica_api_to_candidates(cycle, category)
  end
end
