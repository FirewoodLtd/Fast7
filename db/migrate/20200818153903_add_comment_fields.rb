class AddCommentFields < ActiveRecord::Migration[5.0]
  def change
    
    add_column :documents, :name, :string
    
    add_column :review_measures, :comments_disposition, :string
    
    add_column :documents, :comments, :text
    add_column :documents, :comments_disposition, :string
    
    add_column :review_evidences, :comments, :text
    add_column :review_evidences, :comments_disposition, :string
    
    add_column :action_items, :comments, :text
    add_column :action_items, :comments_disposition, :string
    
    rename_column :interviews, :notes, :comments
    add_column :interviews, :comments_disposition, :string
    
  end
end
