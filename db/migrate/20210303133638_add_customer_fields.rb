class AddCustomerFields < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :tier, :text
  end
end
