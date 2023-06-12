class AddUserNotes < ActiveRecord::Migration[5.0]
  def change
    
      add_column :interviews, :notes, :text
      
      add_column :users, :notes, :text
  end
end
