# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'google/apis/civicinfo_v2'
cycle = '2020'
category = 'contribution-total'

RSpec.describe CampaignFinance, type: :model do
  describe '.fetch_top_candidates' do
    it 'returns top candidates for specified cycle and category' do
      candidates = described_class.fetch_top_candidates(cycle, category)
      puts candidates.pluck('name')

      expect(candidates).to be_an_instance_of(Array)
      expect(candidates.length).to eq(20) # Assuming it returns an array of 20 candidates
      # Add more expectations based on the expected response structure or candidate attributes
    end
  end
end
