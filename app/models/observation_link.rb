class ObservationLink < ApplicationRecord
    belongs_to :observation
    belongs_to :document, :optional => :true
    belongs_to :interview, :optional => :true
    belongs_to :review_measure, :optional => :true
    
    
    has_one :review, :through => :observation

end
