class BaseModel < ActiveRecord::Migration[5.0]
  def self.up
    
        
    #lookup tables
    create_table :document_types do |t|
      t.string :name, null: false
    end
    add_index :document_types, :name, unique: true
    
    create_table :roles do |t|
      t.string :name, null: false
    end
    add_index :roles, :name, unique: true
    
    create_table :project_types do |t|
      t.string :name, null: false
    end   
    add_index :project_types, :name, unique: true
    
    create_table :status_types do |t|
      t.string :name, null: false
      t.string :description
      t.integer :priority
    end
    add_index :status_types, :name, unique: true
    
    create_table :occupation_types do |t|
      t.string :name, null: false
      t.text :tags
    end
    add_index :occupation_types, :name, unique: true
        
    
    #core tables
    create_table :customers do |t|
      t.string :name, null: false
      t.boolean :is_enabled, null: false, default: true
      t.timestamps
    end
    add_index :customers, :name, unique: true
    

    create_table :users do |t|
      t.integer :customer_id
      t.integer :role_id
      t.boolean :is_enabled, null: false, default: true
      t.string  :first_name
      t.string  :last_name
      t.timestamps
    end    
    add_foreign_key :users, :customers
    add_foreign_key :users, :roles
    
    

    
    
    
    #engagements
    create_table :engagements do |t|
      t.integer :customer_id, null: false
      t.boolean :is_enabled, null: false, default: true
      t.integer :lead_firewood_user_id, null: false
      t.integer :lead_customer_user_id
      t.datetime :start_date
      t.datetime :stop_date
      t.string :reference_cd
      t.timestamps
    end    
    add_index :engagements, [:customer_id, :start_date], unique: true
    add_foreign_key :engagements, :customers

    create_table :user_engagements do |t|
      t.integer :user_id, null: false
      t.integer :engagement_id, null: false
      t.timestamps
    end    
    add_index :user_engagements, [:user_id, :engagement_id], unique: true
    add_foreign_key :user_engagements, :users
    add_foreign_key :user_engagements, :engagements  
    
    
    #projects
    create_table :projects do |t|
      t.integer :customer_id, null: false
      t.integer :project_type_id, null: false
      t.string :name, null: false
      t.string :description
      t.boolean :is_enabled, null: false, default: true
      t.integer :budget
      t.timestamps
    end    
    add_index :projects, [:customer_id, :project_type_id, :name ], unique: true
    add_foreign_key :projects, :customers
    add_foreign_key :projects, :project_types
    

    #measures  
    create_table :categories do |t|
      t.string :code, null: false
      t.string :name, null: false
    end
    add_index :categories, [:code, :name], unique: true
    
    create_table :sub_categories do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :category_id, null: false
    end
    add_index :sub_categories, [:code, :name], unique: true
    add_foreign_key :sub_categories, :categories
    
    create_table :measures do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :sub_category_id, null: false
      t.string :description
    end
    add_index :measures, [:code, :name], unique: true
    add_foreign_key :measures, :sub_categories    
  
    create_table :evidences do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :measure_id, null: false
    end
    add_index :evidences, [:code, :name], unique: true
    add_foreign_key :evidences, :measures 
    
    create_table :measure_document_types do |t|
      t.integer :measure_id, null: false
      t.integer :document_type_id, null: false
    end
    add_index :measure_document_types, [:measure_id, :document_type_id], unique: true
    add_foreign_key :measure_document_types, :measures   
    add_foreign_key :measure_document_types, :document_types     
    
    
    
    #scores
    create_table :scores do |t|
      t.string :name, null: false
    end
    add_index :scores, :name, unique: true    
    
    create_table :score_ranges do |t|
      t.integer :score_id, null: false
      t.string :name, null: false
      t.integer :min, null: false
      t.integer :max, null: false
      t.string :color, default: '#999999'
    end
    add_index :score_ranges, [:score_id, :min, :max], unique: true    
    add_foreign_key :score_ranges, :scores     
    
    
    
    
    #reviews
    create_table :reviews do |t|
      t.integer :project_id, null: false
      t.integer :engagement_id, null: false
      t.integer :score_id, null: false
      t.text :summary
      t.text :context
      t.text  :scope
      t.text  :enquiry
      t.timestamps
    end
    add_foreign_key :reviews, :projects 
    add_foreign_key :reviews, :engagements     
    add_foreign_key :reviews, :scores    
    
    
    create_table :documents do |t|
      t.integer :review_id, null: false
      t.integer :document_type_id, null: false
      t.string :url
    end
    add_index :documents, [:review_id, :document_type_id], unique: true
    add_foreign_key :documents, :reviews    
    add_foreign_key :documents, :document_types      
    
    
    #interviews
    create_table :interviews do |t|
      t.integer :review_id, null: false
      t.integer :occupation_type_id, null: false
      t.integer :user_id
      t.datetime :interview_date
      t.boolean :is_enabled, default: false
      t.text :notes
    end
    add_index :interviews, [:review_id, :occupation_type_id], unique: true
    add_foreign_key :interviews, :reviews    
    add_foreign_key :interviews, :occupation_types      
    add_foreign_key :interviews, :users  
    
    
    create_table :review_measures do |t|
      t.integer :review_id, null: false
      t.integer :measure_id, null: false
      t.integer :user_id, null: false
      t.boolean :is_enabled, default: true
      t.integer :score
      t.integer :weight, default: 1.0
      t.text :comments
      t.timestamps
    end
    add_index :review_measures, [:review_id, :measure_id], unique: true
    add_foreign_key :review_measures, :reviews 
    add_foreign_key :review_measures, :measures 
    add_foreign_key :review_measures, :users
    
    
    create_table :review_sub_categories do |t|
      t.integer :review_id, null: false
      t.integer :sub_category_id, null: false
      t.integer :user_id, null: false
      t.boolean :is_enabled, default: true
      t.integer :user_score
      t.integer :score
      t.text :comments
      t.timestamps
    end
    add_index :review_sub_categories, [:review_id, :sub_category_id], unique: true
    add_foreign_key :review_sub_categories, :reviews 
    add_foreign_key :review_sub_categories, :sub_categories     
    add_foreign_key :review_sub_categories, :users
    

    create_table :review_categories do |t|
      t.integer :review_id, null: false
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.boolean :is_enabled, default: true
      t.integer :user_score
      t.integer :score
      t.text :comments
      t.timestamps
    end
    add_index :review_categories,[:review_id, :category_id], unique: true
    add_foreign_key :review_categories, :reviews 
    add_foreign_key :review_categories, :categories     
    add_foreign_key :review_categories, :users    
    
    
    create_table :review_evidences do |t|
      t.integer :review_measure_id, null: false
      t.integer :document_id, null: false
    end
    add_index :review_evidences, [:review_measure_id, :document_id], unique: true
    add_foreign_key :review_evidences, :review_measures
    add_foreign_key :review_evidences, :documents
    

    #findings
    create_table :findings do |t|
      t.integer :review_measure_id, null: false
      t.integer :status_type_id, null: false
      t.string :description, null: false
      t.integer :user_id
      t.boolean :is_agreed
      t.text :evidence
      t.text :concern
      t.text :implication
      t.text :recommendation
    end
    add_foreign_key :findings, :status_types
    add_foreign_key :findings, :users
    add_index :findings, [:review_measure_id, :description], unique: true
    
    
    create_table :action_items do |t|
      t.integer :finding_id
      t.integer :user_id
      t.datetime :due_date
      t.boolean :is_enabled
      t.text  :description
    end
    add_foreign_key :action_items, :findings
    add_foreign_key :action_items, :users    

    
    
    
    #templates
    create_table :templates do |t|
      t.string :name, null: false
      t.string :description
    end
    add_index :templates, :name, unique: true
    
    create_table :template_categories do |t|
      t.integer :template_id, null: false
      t.integer :category_id, null: false
    end
    add_index :template_categories, [:template_id, :category_id], unique: true      
    add_foreign_key :template_categories, :templates 
    add_foreign_key :template_categories, :categories     


  end
  
  def self.down
    
  
    
    
  end
    
end

