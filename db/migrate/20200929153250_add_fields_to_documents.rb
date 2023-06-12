class AddFieldsToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :is_enabled, :boolean, :default => false
  end
end
