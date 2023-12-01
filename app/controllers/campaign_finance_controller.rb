# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index
    @campaign_finance = CampaignFinance.all
  end

  def search
    selected_cycle = params[:election_cycle]
    selected_category = params[:category]
    candidates_data = CampaignFinance.propublica_api_to_representatives(selected_cycle, selected_category)
    puts "Test"
    #puts candidates_data.pluck('name')
    puts "Heroku sucks"
    #Not sure about the next two lines
    @data = candidates_data#.pluck('name')
    put @data
    #render 'campaign_finance/search'
    respond_to do |format|
      format.html { render 'campaign_finance/search' } # Render the search view for HTML requests
      format.json { render json: candidates_data } # Return JSON for JSON requests
    end
  end
=begin
  def search
    cycle = params[:cycle]
    category = params[:category]
    api_key = ENV['PROPUBLICA_API_KEY']
    service = CampaignFinance.initialize(api_key)
    result = service.propublica_api_to_candidates(cycle, category)
  end
=end
end
