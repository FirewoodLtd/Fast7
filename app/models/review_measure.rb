class ReviewMeasure < ApplicationRecord
   belongs_to :user
   belongs_to :review
   belongs_to :measure
   
   has_many :review_evidences, dependent: :destroy
   
   has_many :findings, dependent: :destroy
   has_many :action_items, :through => :findings
   
   has_one :category, :through => :measure
   has_many :evidences, :through => :measure
   has_many :document_types, :through => :measure
   
   has_many :observation_links, dependent: :destroy
   has_many :observations, :through => :observation_links
   
   public
   
   def name
      return self.measure.name
   end
   
   def self.icon
      return Measure.icon
   end   
   
   def root_category
      return self.category.ancestors[1] if self.category.depth > 1
      return self.category
   end
   
   def status_text
     return self.is_enabled ? "Active" : "Inactive"
   end
   
   def status_color
      return self.is_enabled ? "#0D978E" : "#F91D1D"
   end  

   def get_score_range
      s = self.review.score.get_score_range(self.score)
      s.color='gray' if !self.is_enabled
      return s
   end
   
end
