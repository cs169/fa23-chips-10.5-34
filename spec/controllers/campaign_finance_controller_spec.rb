# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'google/apis/civicinfo_v2'
cycle = '2020'
category = 'contribution-total'

RSpec.describe CampaignFinanceController, type: :controller do
  describe 'POST #search' do
    it 'returns a successful response' do
      allow_any_instance_of(described_class).to receive(:search).and_return(Net::HTTPSuccess.new(1.0, '200',
                                                                                                 'OK'))

      post :search, params: { cycle: cycle, category: category }

      expect(response).to have_http_status(:ok)
      puts response
    end
  end

  describe 'GET #search' do
    it 'returns the error code and output for cycle 2020 and category contribution-total' do
      # Stubbing the method to prevent actual API calls
      allow(CampaignFinance).to receive(:fetch_top_candidates).and_return([])

      get :search, params: { election_cycle: cycle, category: category }
    end
  end
end
