# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []
    rep_info.officials.each_with_index do |official, index|
      title_temp = ''
      ocdid_temp = ''
      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end
      address_temp = official.address
      if Representative.find_by(name: official.name).nil?
        rep = create_rep(address_temp, title_temp, ocdid_temp, official)
      else
        rep = Representative.find_by(name: official.name)
        rep.update(
          ocdid: ocdid_temp,
          title: title_temp,
          line1: address_temp.line1,
          line2: address_temp.line2,
          line3: address_temp.line3,
          city:  address_temp.city,
          state: address_temp.state,
          zip:   address_temp.zip,
          party: official.party,
          photo: official.photo_url
        )
      end
      reps.push(rep)
    end
    reps
  end

  def create_rep(address, title, ocd, official)
    rep = Representative.create!(
      {
        name:  official.name,
        ocdid: ocd,
        title: title,
        line1: address.line1,
        line2: address.line2,
        line3: address.line3,
        city:  address.city,
        state: address.state,
        zip:   address.zip,
        party: official.party,
        photo: official.photo_url
      }
    )
    rep
  end
end
