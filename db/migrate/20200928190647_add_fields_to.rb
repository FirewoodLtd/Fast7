class AddFieldsTo < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :framework, :string
    add_column :categories, :primary, :string
  end
end
