# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index
    @campaign_finances = CampaignFinances.all
  end

  def search
    cycle, category = params[:cycle, :category]
    api_key = ENV['PROPUBLICA_API_KEY']
    service = CampaignFinances.initialize(api_key)
    result = service.propublica_api_to_candidates(cycle, category)
  end
end
