class Template < ApplicationRecord
   has_many :reviews
   
   has_many :template_measures, dependent: :destroy
   has_many :measures, :through  => :template_measures
   
   has_many :customer_templates, dependent: :destroy
   has_many :customers, :through => :customer_templates
   
   def self.icon
      return 'list'
   end
end