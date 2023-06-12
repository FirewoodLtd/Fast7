class Interview < ApplicationRecord
   belongs_to :review
   belongs_to :occupation_type
   belongs_to :user, :optional => :true
   
   has_many :observation_links, dependent: :destroy
   has_many :observations, :through => :observation_links
   
   
   def name
      return self.occupation_type.name unless self.id.nil?
   end
   
   def self.icon
      return 'user'
   end
   
   def status_text
     return self.is_enabled ? "To Do" : "Done"
   end
   
   def status_color
      return self.is_enabled ? "#F97F23" : "#1D6FB6"
   end   
   
end
