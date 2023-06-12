class AddMoreObservations < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :review_evidences, :comments
    remove_column :review_evidences, :comments_disposition
    
  end
end
