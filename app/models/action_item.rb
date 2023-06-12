class ActionItem < ApplicationRecord
   include ApplicationHelper
   
   belongs_to :finding
   validates_presence_of :finding
   validates_presence_of :status
   validates_presence_of :due_date
   validates_presence_of :requested_date
   
   belongs_to :user

   def name
      return "#{self.description}-#{self.status}"
   end  
   
   def self.icon
      return 'bolt'
   end
   
   def review
      return self.finding.review
   end
   
   
   def get_color
      begin
         return action_item_status.find { |i| i[0] == self.status } [1]
      rescue Exception => e
         return 'gray'
      else
         # other exception
      ensure
         # always executed
      end

   end

end
