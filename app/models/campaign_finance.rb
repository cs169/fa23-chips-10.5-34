# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  def self.fetch_top_candidates(cycle, category)
    url = URI.parse("https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json")

    request = Net::HTTP::Get.new(url)
    request['X-API-Key'] = '9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA'

    response = Net::HTTP.start(url.hostname, url.port, use_ssl: url.scheme == 'https') do |http|
      http.request(request)
    end

    cdata = JSON.parse(response.body)
    data = cdata['results']
    data
  end
end
