class CreateCampaignFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_finances do |t|
      t.string :name
    end
  end
end
