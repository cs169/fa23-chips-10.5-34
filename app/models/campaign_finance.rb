# frozen_string_literal: true

require 'httparty'

class CampaignFinance < ApplicationRecord
  #base_uri = 'https://api.propublica.org'
  base_uri = 'https://api.propublica.org/campaign-finance/v1'
  include HTTParty

  def initialize(api_key)
    @api_key = api_key
    @headers = {
      'X-API-Key'    => @api_key,
      'Content-Type' => 'application/json'
    }
  end
=begin
  def self.fetch_top_candidates(cycle, category)
    candidates_data = []
    api_key = 'YOUR_API_KEY_HERE'
    url = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"

    headers = {
      'X-API-Key': api_key
    }
    response = self.class.get("/#{cycle}/candidates/leaders/#{category}.json", headers: @headers)
    #response = RestClient.get(url, headers)

    candidates_data = JSON.parse(response.body)['results']
    return candidates_data.first(20)
  end
=end
  def self.fetch_top_candidates(cycle, category)
    puts 'Hi'
    base_url = 'https://api.propublica.org/campaign-finance/v1'
    cycle = '2020'
    category = 'contribution-total'
    url = URI("#{base_url}/#{cycle}/candidates/leaders/#{category}.json")

    # Create an HTTP request
    request = Net::HTTP::Get.new(url)
    request['X-API-Key'] = "9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA"  # Replace 'YOUR_API_KEY' with your actual API key

    # Make the request and handle the response
    response = Net::HTTP.start(url.hostname, url.port, use_ssl: url.scheme == 'https') do |http|
      http.request(request)
    end
    cdata = JSON.parse(response.body)
    data = cdata['results']
    #data['results'].each do |candidate|
      #puts candidate['name']
    #end
    data
  end

  def self.propublica_api_to_representatives(_cycle, _category)
    puts 'Hi'
    base_url = 'https://api.propublica.org/campaign-finance/v1'
    url = URI("#{base_url}/#{_cycle}/candidates/leaders/#{_category}.json")

    # Create an HTTP request
    request = Net::HTTP::Get.new(url)
    request['X-API-Key'] = "9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA"  # Replace 'YOUR_API_KEY' with your actual API key

    # Make the request and handle the response
    response = Net::HTTP.start(url.hostname, url.port, use_ssl: url.scheme == 'https') do |http|
      http.request(request)
    end
    cdata = JSON.parse(response.body)
    data = cdata['results']
    #data['results'].each do |candidate|
      #puts candidate['name']
    #end
    data
  end
=begin
def self.propublica_api_to_representatives(_cycle, _category)
    puts 'hi'
    cycle = '2020'
    category = 'contribution-total'
    candidates = []
    response = self.class.get("/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json", headers: @headers)
    JSON.parse(response.body)['results'].each_with_index do |result, _index|
      candidates.push(result.name)
    end
    candidates
  end
=end
end
