# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index
    @campaign_finance = CampaignFinance.all
  end

  def search
    selected_cycle = params[:cycle]
    selected_category = params[:category]
    candidates_data = CampaignFinance.fetch_top_candidates(selected_cycle, selected_category)
    @data = candidates_data
    render 'campaign_finance/search'
  end
end
