class Document < ApplicationRecord
   belongs_to :document_type
   belongs_to :review
   
   has_many :review_evidences, dependent: :destroy
   
   has_many :observation_links, dependent: :destroy
   has_many :observations, :through => :observation_links
   
   
   def self.icon
      return 'file'
   end   
   
   def status_text
     return self.is_enabled ? "To Do" : "Done"
   end
   
   def status_color
      return self.is_enabled ? "#F97F23" : "#1D6FB6"
   end

   
   def type_name
      return self.document_type.name
   end
   
end
