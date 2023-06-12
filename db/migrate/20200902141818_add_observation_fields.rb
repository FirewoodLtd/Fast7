class AddObservationFields < ActiveRecord::Migration[5.0]
  def change
    
    add_column :observations, :review_id, :integer
    
    add_foreign_key :observations, :reviews
    
  end
end
