# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'google/apis/civicinfo_v2'

describe Representative do
  describe '.civic_api_to_representative_params' do
    before do
      address = '1 Dr Carlton B Goodlett Pl, San Francisco, CA 94102'
      service = Google::Apis::CivicinfoV2::CivicInfoService.new
      service.key = Rails.application.credentials[:GOOGLE_API_KEY]
      @rep_info = service.representative_info_by_address(address: address)
    end

    it 'creates representatives based on civic API data' do
      representatives = described_class.civic_api_to_representative_params(@rep_info)
      
      expect(representatives[0].name).to eq('Joseph R. Biden')
      expect(representatives[0].title).to eq('President of the United States')
      expect(representatives[1].name).to eq('Kamala D. Harris')
      expect(representatives[1].title).to eq('Vice President of the United States')

      expect(representatives.length).to eq(28)
    end
  end
end