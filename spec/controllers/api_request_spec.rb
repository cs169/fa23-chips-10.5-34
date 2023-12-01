require 'rails_helper'
require 'json'
require 'net/http'

RSpec.describe 'API Request', type: :request do
  it 'makes an API request and prints the result' do
    api_key = '9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA' # Replace with your actual API key
    cycle = '2020'
    category = 'contribution-total'

    endpoint = URI("https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json")

    http = Net::HTTP.new(endpoint.host, endpoint.port)
    http.use_ssl = true
    headers = {
      'X-API-Key': api_key
    }

    request = Net::HTTP::Get.new(endpoint)
    headers.each { |key, value| request[key] = value }

    response = http.request(request)

    # Check if the response was successful (status code 200)
    expect(response.code).to eq('200')

    # Print out the response body
    puts "Response Body:"
    parsed_response = JSON.parse(response.body)
    parsed_response['results'].each do |candidate|
      #puts candidate['name']
    end
  end
end