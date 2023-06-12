class Measure < ApplicationRecord
   belongs_to :category
   
   has_many :evidences, dependent: :destroy
   
   has_many :measure_document_types, dependent: :destroy
   has_many :document_types, :through  => :measure_document_types
   
   has_many :template_measures, dependent: :destroy
   has_many :templates, :through  => :template_measures
   
   has_many :review_measures, dependent: :destroy
   has_many :reviews, :through => :review_measures
   

   def self.icon
      return 'balance-scale'
   end
   
   def get_guidance(score_range)
      #to do, lookup guidance
      val=self.category.category_score_ranges.where(:score_range => score_range).first
      return '' if val.nil? 
      return val.description
   end
   
end
