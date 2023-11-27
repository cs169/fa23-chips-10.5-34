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
      rep = if Representative.find_by(name: official.name).nil?
              create_rep(official, ocdid_temp, title_temp, address_temp)
            else
              rep_test(official, ocdid_temp, title_temp, address_temp)
            end
      reps.push(rep)
    end
    reps
  end

  def rep_test(official, ocdid, title, address)
    rep = Representative.find_by(name: official.name)
    rep.update(
      ocdid: ocdid,
      title: title,
      line1: address.line1,
      line2: address.line2,
      line3: address.line3,
      city:  address.city,
      state: address.state,
      zip:   address.zip,
      party: official.party,
      photo: official.photo_url
    )
    rep
  end

  def create_rep(official, ocdid, title, address)
    Representative.create!(
      {
        name:  official.name,
        ocdid: ocdid,
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
  end
end
