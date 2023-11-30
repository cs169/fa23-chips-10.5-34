# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'google/apis/civicinfo_v2'


RSpec.describe CampaignFinanceController do
  describe '#search' do
    let(:candidate_data_searcher) { CampaignFinanceController.new }

    it 'makes a successful API request' do
      cycle = '2020'
      category = 'contribution-total'

      # Stub the HTTP request for testing purposes
      stub_request(:get, "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json")
        .with(headers: { 'X-API-Key' => '9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA' })
        .to_return(status: 200, body: "", headers: {})

      response = candidate_data_searcher.search(cycle, category)
      
      expect(response.code).to eq('200')
    end
  end
end
RSpec.describe CampaignFinanceController, type: :controller do
  describe 'POST #search' do
    it 'returns a successful response' do
      cycle = '2020'
      category = 'contribution-total'

      allow_any_instance_of(CandidateDatasearcher).to receive(:search).and_return(Net::HTTPSuccess.new(1.0, '200', 'OK'))

      post :search, params: { cycle: cycle, category: category }
      
      expect(response).to have_http_status(200)
    end
  end
end