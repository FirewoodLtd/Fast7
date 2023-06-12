class ModelUpdates02 < ActiveRecord::Migration[5.0]
  def change
        drop_table :categories
    
        rename_table :sub_categories, :categories
        add_column :sub_categories, :parent_id, :integer
        
        
        
  end
end
