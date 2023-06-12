class Review < ApplicationRecord
   belongs_to :project
   belongs_to :score
   belongs_to :lead_customer_user, :class_name => 'User', optional: true
   belongs_to :lead_firewood_user, :class_name => 'User', optional: true   
   
   has_one :customer, :through => :project
   
   has_many :documents, dependent: :destroy
   has_many :document_types, :through  => :documents
   
   
   has_many :interviews, dependent: :destroy
   has_many :occupation_types, :through  => :interviews
   
   has_many :review_measures, dependent: :destroy
   has_many :measures, :through  => :review_measures
   has_many :findings, :through => :review_measures
   has_many :action_items, :through => :review_measures
   has_many :review_evidences, :through => :review_measures
   
   has_many :observations, dependent: :destroy
   has_many :observation_links, :through => :observations
   
   attr_accessor :templates
   
   public
   
   def name
      return self.project.name
   end
   
   def self.icon
      return 'clipboard'
   end
   
   
   def status_text
     return self.is_enabled ? "Open" : "Closed"
   end
   
   def status_color
      return self.is_enabled ? "#FF6B6B" : "#666666"
   end     
   
   def get_score_range
      s = self.score.get_score_range(self.overall_score)
      s.color='gray' if !self.is_enabled
      return s      
   end

   def overall_score
      return self.get_review_measures_score(self.review_measures).round(1)
   end   
   
   def total_complete
      complete=0
      self.review_measures.each do |m|
         if !m.score.nil? 
            complete+=1|| !m.is_enabled
         end
      end
      return complete
   end
   
   def pct_complete
      numerator = self.total_complete.to_f
      denominator = self.review_measures.where(is_enabled: :true).count.to_f
      return 0 if denominator==0
      return (numerator/denominator).round(1)
   end
   
   
   def pct_complete_documents
      return 0 if self.documents.count==0
      return (self.documents.where(is_enabled: :false).count.to_f/self.documents.count.to_f).round(1)
   end
   
   def pct_complete_interviews
      return 0 if self.interviews.count==0
      return (self.interviews.where(is_enabled: :false).count.to_f/self.interviews.count.to_f).round(1)
   
   end   
   
   def pct_complete_action_items
      return 0 if self.action_items.count==0
      return (self.action_items.where(:status => 'Complete').count.to_f/self.action_items.count.to_f).round(1)
   
   end  
   
   def get_review_measures_score review_measures
      max=self.score.score_ranges.maximum("max") #replace with database defined min/max ranges, find from scores
      
      numerator = 0
      denominator = 0
      
      review_measures.each do |m|
         if m.is_enabled && !m.score.nil?
            m.weight = 1.0 if m.weight.nil?
            numerator += m.score * m.weight
            denominator += max * m.weight 
         end
      end
      return (max * (numerator.to_f/denominator.to_f)).to_f unless denominator == 0
      return 0
   end   
   
end
