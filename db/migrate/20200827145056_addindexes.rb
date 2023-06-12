class Addindexes < ActiveRecord::Migration[5.0]
  def change
    add_index :category_score_ranges, [:category_id, :score_range_id], unique: true    
  end
end
