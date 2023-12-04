# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'google/apis/civicinfo_v2'

RSpec.describe CampaignFinanceController, type: :controller do
  describe 'POST #search' do
    it 'returns a successful response' do
      cycle = '2020'
      category = 'contribution-total'

      allow_any_instance_of(described_class).to receive(:search).and_return(Net::HTTPSuccess.new(1.0, '200',
                                                                                                 'OK'))

      post :search, params: { cycle: cycle, category: category }

      expect(response).to have_http_status(:ok)
      puts response
    end
  end
end

RSpec.describe CampaignFinanceController, type: :controller do
  describe 'GET #search' do
    it 'returns the error code and output for cycle 2020 and category contribution-total' do
      cycle = '2020'
      category = 'contribution-total'

      # Stubbing the method to prevent actual API calls
      allow(CampaignFinance).to receive(:fetch_top_candidates).and_return([])

      get :search, params: { election_cycle: cycle, category: category }

      # Access the assigns to retrieve the instance variable set in the controller
      error_code = response.status
      output = :candidates_data['results']

      # Print error code and output
      puts "Error Code: #{error_code}"
      puts "Output: #{output}"
    end
  end
end

RSpec.describe CampaignFinance, type: :model do
  describe '.fetch_top_candidates' do
    it 'returns top candidates for specified cycle and category' do
      cycle = '2020'
      category = 'contribution-total'

      candidates = described_class.fetch_top_candidates(cycle, category)
      puts candidates.pluck('name')

      expect(candidates).to be_an_instance_of(Array)
      expect(candidates.length).to eq(20) # Assuming it returns an array of 20 candidates
      # Add more expectations based on the expected response structure or candidate attributes
    end
  end
end
