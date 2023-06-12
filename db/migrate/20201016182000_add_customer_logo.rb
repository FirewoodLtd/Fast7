class AddCustomerLogo < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :logo_url, :string
    add_column :customers, :color_primary, :string
    add_column :customers, :color_secondary, :string
    add_column :customers, :color_light, :string
    add_column :customers, :color_dark, :string
  end
end
