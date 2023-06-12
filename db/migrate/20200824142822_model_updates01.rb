class ModelUpdates01 < ActiveRecord::Migration[5.0]
  def change
    
    #measure source
    create_table :measure_sources do |t|
      t.string :name, null: false
    end    
    add_index :measure_sources, :name, unique: true
    
    add_column :measures, :measure_source_id, :integer
    add_foreign_key :measures, :measure_sources
    
    
    #interview additions
    add_column :interviews, :participants, :string
    
    #action items
    add_column :action_items, :requested_date, :datetime
    add_column :action_items, :completed_date, :datetime
    add_column :action_items, :status_date, :datetime
    add_column :action_items, :status, :string
    
    #templates
    create_table :template_measures do |t|
      t.integer :template_id, null: false
      t.integer :measure_id, null: false
    end
    add_index :template_measures, [:template_id, :measure_id], unique: true      
    add_foreign_key :template_measures, :templates 
    add_foreign_key :template_measures, :measures   
    
    #drop_table :template_categories
    
    
    #projects
    
    add_column :projects, :objective, :text
    
    create_table :impact_types do |t|
      t.string :name, null: false
    end    
    add_index :impact_types, :name, unique: true

    create_table :project_impact_types do |t|
      t.integer :project_id, null: false
      t.integer :impact_type_id
    end   
    add_foreign_key :project_impact_types, :projects
    add_foreign_key :project_impact_types, :impact_types   
    
    
    create_table :industry_types do |t|
      t.string :name, null: false
      t.integer :parent_id
    end    
    add_index :industry_types, :name, unique: true    
    
    add_column :projects, :industry_type_id, :integer
    add_foreign_key :projects, :industry_types   
    
    
    
    create_table :department_types do |t|
      t.string :name, null: false
    end
    add_index :department_types, :name, unique: true

    create_table :project_department_types do |t|
      t.integer :project_id, null: false
      t.integer :department_type_id
    end   
    add_foreign_key :project_department_types, :projects
    add_foreign_key :project_department_types, :department_types   
    
    
    create_table :life_cycle_types do |t|
      t.string :name, null: false
    end
    add_index :life_cycle_types, :name, unique: true    
    
    add_column :projects, :life_cycle_type_id, :integer
    add_foreign_key :projects, :life_cycle_types   
    
    
    create_table :certification_types do |t|
      t.string :name, null: false
    end
    add_index :certification_types, :name, unique: true

    create_table :project_certification_types do |t|
      t.integer :project_id, null: false
      t.integer :certification_type_id
    end   
    add_foreign_key :project_certification_types, :projects
    add_foreign_key :project_certification_types, :certification_types       
    
    
    #customers
    add_column :customers, :address, :string
    add_column :customers, :registration_num, :string
    add_column :customers, :contact_main_name, :string
    add_column :customers, :contact_main_title, :string
    add_column :customers, :contact_main_address, :string
    add_column :customers, :contact_main_phone, :string
    add_column :customers, :contact_main_email, :string
    add_column :customers, :contact_billing_name, :string
    add_column :customers, :contact_billing_title, :string
    add_column :customers, :contact_billing_address, :string
    add_column :customers, :contact_billing_phone, :string
    add_column :customers, :contact_billing_email, :string
    add_column :customers, :contact_technical_name, :string
    add_column :customers, :contact_technical_title, :string
    add_column :customers, :contact_technical_address, :string
    add_column :customers, :contact_technical_phone, :string
    add_column :customers, :contact_technical_email, :string
  end
end