class Customer < ApplicationRecord
  has_many :users, dependent: :destroy
  
  has_many :projects, dependent: :destroy
  has_many :reviews, :through  => :projects
  
  has_many :interviews, :through => :reviews
  has_many :documents, :through => :reviews
  has_many :action_items, :through => :reviews
  has_many :findings, :through => :reviews
  has_many :review_measures, :through => :reviews
  has_many :measures,  :through => :review_measures
  
  has_many :customer_templates, dependent: :destroy
  has_many :templates,  :through => :customer_templates
  
  has_many :customer_categories, dependent: :destroy
  has_many :categories, :through => :customer_categories


   def self.icon
      return 'building-o'
   end
   
   def status_text
     return self.is_enabled ? "Active" : "Inactive"
   end
   
   def status_color
      return self.is_enabled ? "#0D978E" : "#F91D1D"
   end

  def industries
    i=[]
    self.projects.each do |project|
      i << project.industry_type.name unless project.industry_type.nil?
    end
    return i.uniq
  end

end


