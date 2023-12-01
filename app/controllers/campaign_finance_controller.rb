# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index
    @campaign_finance = CampaignFinance.all
  end

  def search
    selected_cycle = params[:election_cycle]
    selected_category = params[:category]
    candidates_data = CampaignFinance.fetch_top_candidates(selected_cycle, selected_category)
    puts "Test"
    if candidates_data.nil?
    puts candidates_data.pluck('name')
    puts "HI"
    @data = candidates_data.pluck('name')
    render 'campaign_finance/search'
  end
end
