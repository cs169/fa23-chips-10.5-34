# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

class CampaignFinance < ApplicationRecord

  def self.fetch_top_candidates(cycle, category)
    url = URI.parse("https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json")

    # Create an HTTP request
    request = Net::HTTP::Get.new(url)
    request['X-API-Key'] = '9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA'  # Replace 'YOUR_API_KEY' with your actual API key

    # Make the request and handle the response
    response = Net::HTTP.start(url.hostname, url.port, use_ssl: url.scheme == 'https') do |http|
      http.request(request)
    end
    if response.code == '200'
      data = JSON.parse(response.body)
      cdata = data["results"]
      cdata
    else
      puts "Error: #{response.code} - #{response.message}"
    end
  end
end
