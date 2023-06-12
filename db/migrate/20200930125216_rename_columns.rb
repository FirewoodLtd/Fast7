class RenameColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :documents, :is_enabled, :is_enabled
    rename_column :interviews, :is_enabled, :is_enabled
    
  end
end
