class AddObservations < ActiveRecord::Migration[5.0]
  def change
    
    create_table :observations do |t|
      t.integer :user_id
      t.text :comments, null: false
      t.string  :disposition, null: false, default: 'Neutral'
      t.timestamps
    end    
    add_foreign_key :observations, :users
    
    
    create_table :observation_links do |t|
      t.integer :document_id
      t.integer :interview_id
      t.integer :review_measure_id
      t.timestamps
    end    
    add_foreign_key :observation_links, :documents
    add_foreign_key :observation_links, :interviews
    add_foreign_key :observation_links, :review_measures
    
    # remove all the comments fields
    remove_column :documents, :comments
    remove_column :documents, :comments_disposition
    
    remove_column :interviews, :comments
    remove_column :interviews, :comments_disposition
    
    remove_column :review_measures, :comments
    remove_column :review_measures, :comments_disposition
    
    
  end
end
