# frozen_string_literal: true

class AddLine3ToRepresentatives < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :line3, :string
  end
end
