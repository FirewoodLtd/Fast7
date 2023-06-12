class AddObservationLinkFields < ActiveRecord::Migration[5.0]
  def change
      add_column :observation_links, :observation_id, :integer
    
      add_foreign_key :observation_links, :observations
  end
end
