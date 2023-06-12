class ReviewEvidence < ApplicationRecord
   belongs_to :review_measure
   belongs_to :document
   
   def name
      return self.review_measure.name
   end
end
