# frozen_string_literal: true

class AddLine1ToRepresentatives < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :line1, :string
  end
end
