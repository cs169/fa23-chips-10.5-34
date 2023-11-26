# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''
      address_temp = ''
      party_temp = ''
      photo_temp = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end
      if Representative.find_by(name: official.name).nil?
        address_temp = official.address
        party_temp = official.party
        photo_temp = official.photoUrl
        rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
            title: title_temp })
      else
        rep = Representative.find_by(name: official.name)
        rep.update(ocdid: ocdid_temp, title: title_temp)
      end
<<<<<<< HEAD

      rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
          title: title_temp, address: address_temp, party: party_temp, photo: photo_temp})
      reps.push(rep)
>>>>>>> [backend] I used the api notation for the newly added aspects of the representative information hopefully it works out the spec is pretty vague
=======
      reps.push(rep)
>>>>>>> fixed rubocop issues
    end

    reps
  end
end
