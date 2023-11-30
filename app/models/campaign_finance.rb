# frozen_string_literal: true

require 'httparty'

class CampaignFinance < ApplicationRecord
  base_uri = 'https://api.propublica.org'

  def initialize(api_key)
    @api_key = api_key
    @headers = {
      'X-API-Key'    => @api_key,
      'Content-Type' => 'application/json'
    }
  end

  def self.propublica_api_to_representatives(_cycle, _category)
    candidates = []
    response = self.class.get("/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json", headers: @headers)
    JSON.parse(response.body)['results'].each_with_index do |result, _index|
      candidates.push(result.name)
    end
    candidates
  end
end
