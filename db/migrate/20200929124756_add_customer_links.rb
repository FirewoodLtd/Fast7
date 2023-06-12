class AddCustomerLinks < ActiveRecord::Migration[5.0]
  def change
    
    create_table :customer_templates do |t|
      t.integer :customer_id, null: false
      t.integer :template_id, null: false
    end   
    add_foreign_key :customer_templates, :customers
    add_foreign_key :customer_templates, :templates   
    
    
    create_table :customer_categories do |t|
      t.integer :customer_id, null: false
      t.integer :category_id, null: false
    end   
    add_foreign_key :customer_categories, :customers
    add_foreign_key :customer_categories, :categories   
    
  end
end
