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
        if address_temp.nil?
          address_temp = ''
          rep.update(
            ocdid: ocdid_temp,
            title: title_temp,
            line1: address_temp,
            line2: address_temp,
            line3: address_temp,
            city:  address_temp,
            state: address_temp,
            zip:   address_temp,
            party: official.party,
            photo: official.photo_url
          )
        else
          rep.update(
            ocdid: ocdid_temp,
            title: title_temp,
            line1: address_temp[0].line1,
            line2: address_temp[0].line2,
            line3: address_temp[0].line3,
            city:  address_temp[0].city,
            state: address_temp[0].state,
            zip:   address_temp[0].zip,
            party: official.party,
            photo: official.photo_url
          )
        end
      end
      reps.push(rep)
    end
    reps
  end

  def create_rep(address, title, ocd, official)
    Representative.create!(
      {
        name:  official.name,
        ocdid: ocd,
        title: title,
        line1: address[0].line1,
        line2: address[0].line2,
        line3: address[0].line3,
        city:  address[0].city,
        state: address[0].state,
        zip:   address[0].zip,
        party: official.party,
        photo: official.photo_url
      }
    )
  end
end
