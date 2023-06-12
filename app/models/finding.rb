class Finding < ApplicationRecord
   belongs_to :status_type
   
   belongs_to :review_measure
   validates_presence_of :review_measure
   has_one :measure, :through => :review_measure
   
   belongs_to :user, :optional => :true
   
   has_many :action_items, dependent: :destroy
   
   
   
   def name
      return "#{self.status_type.name}: #{self.description}"
   end   
   
   def self.icon
      return 'search'
   end   
   
   def review
      return self.review_measure.review
   end   
end
