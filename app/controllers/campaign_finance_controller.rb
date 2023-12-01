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
    puts candidates_data.pluck('name')
    puts "HI"
    #Not sure about the next two lines
    respond_to do |format|
      format.html { render 'index' } # Assuming an 'index' template exists for HTML format
      format.json { render json: candidates_data }
    end
    @data = candidates_data.pluck('name')
    render 'campaign_finance/search'
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
