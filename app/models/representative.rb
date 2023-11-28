# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      title_temp, ocdid_temp = find_office_info(rep_info.offices, index)
      address_temp = official.address

      reps.push(update_or_create_rep(title_temp, ocdid_temp, official, address_temp))
    end

    reps
  end

  def self.find_office_info(offices, index)
    title_temp = ''
    ocdid_temp = ''
    offices.each do |office|
      if office.official_indices.include? index
        title_temp = office.name
        ocdid_temp = office.division_id
      end
    end
    [title_temp, ocdid_temp]
  end

  def self.update_or_create_rep(title_temp, ocdid_temp, official, address_temp)
    existing_rep = Representative.find_by(name: official.name)

    if existing_rep.nil?
      create_rep(address_temp, title_temp, ocdid_temp, official)
    else
      update_rep(existing_rep, title_temp, ocdid_temp, official, address_temp)
    end
  end

  def self.create_rep(address, title, ocd, official)
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

  def self.update_rep(rep, title_temp, ocdid_temp, official, address_temp)
    rep.update(
      ocdid: ocdid_temp,
      title: title_temp,
      party: official.party,
      photo: official.photo_url
    )
    if address_temp
      rep.update(
        line1: address_temp[0].line1,
        line2: address_temp[0].line2,
        line3: address_temp[0].line3,
        city:  address_temp[0].city,
        state: address_temp[0].state,
        zip:   address_temp[0].zip
      )
    end

    rep
  end
end