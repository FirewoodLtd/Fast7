class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable
  
  validate :password_complexity
  
  belongs_to :customer, optional: true
  belongs_to :role
  
  has_many :action_items
  has_many :findings
  has_many :observations
  
  has_many :projects, foreign_key: "lead_customer_user_id"
  has_many :projects, foreign_key: "lead_firewood_user_id"
  
  has_many :review_measures
  has_many :reviews, :through  => :review_measures
  
  
   def name
      return self.last_name + ', ' + self.first_name
   end
   
   def friendly_name
      return self.first_name + " " + self.last_name
   end
   
   def self.icon
      return 'user'
   end
   
   def status_text
     return self.is_enabled ? "Active" : "Inactive"
   end

   def status_color
      return self.is_enabled ? "#0D978E" : "#F91D1D"
   end 
   
   def active_for_authentication?
     super && is_enabled
   end  
   
  

  def password_complexity
    if password.present? 
      unless password.match('.*[a-z].*') and password.match('.*[A-Z].*') and password.match('.*\d.*')  
         errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
      end
    end
  end   
   
end
