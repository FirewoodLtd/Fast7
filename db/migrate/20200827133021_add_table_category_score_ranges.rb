class AddTableCategoryScoreRanges < ActiveRecord::Migration[5.0]
  def change
        
    create_table :category_score_ranges do |t|
      t.integer :category_id, null: false
      t.integer :score_range_id, null: false
      t.text :description
    end
    add_foreign_key :category_score_ranges, :categories 
    add_foreign_key :category_score_ranges, :score_ranges   
      
    
  end
end
