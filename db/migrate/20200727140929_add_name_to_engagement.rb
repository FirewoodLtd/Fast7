class AddNameToEngagement < ActiveRecord::Migration[5.0]
  def change
    add_column :engagements, :name, :string  
  end
end
