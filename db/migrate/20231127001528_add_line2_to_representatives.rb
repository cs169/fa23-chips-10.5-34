class AddLine2ToRepresentatives < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :line2, :string
  end
end
