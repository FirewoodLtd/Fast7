class ExtendCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :max_projects, :integer, :default => 1
    add_column :customers, :max_reviews, :integer, :default => 1
    add_column :customers, :max_frameworks, :integer, :default => 1
    add_column :customers, :allow_custom_frameworks, :boolean, :default => false
    add_column :customers, :expires_at, :datetime
  end
end
