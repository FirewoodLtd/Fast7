class ModelUpdates03 < ActiveRecord::Migration[5.0]
  def change
         drop_table :categories
    
        rename_table :sub_categories, :categories
  end
end
