class AddFieldsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :is_enabled, :boolean, null: false, default: true
    add_column :reviews, :lead_firewood_user_id, :integer
    add_column :reviews, :lead_customer_user_id, :integer
    add_column :reviews, :start_date, :datetime
    add_column :reviews, :stop_date, :datetime
    add_column :reviews, :reference_cd, :string
    
    
    remove_foreign_key :reviews, :engagements
    remove_column :reviews, :engagement_id
    
    drop_table :user_engagements
    drop_table :engagements

  end
end

