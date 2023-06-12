class Observation < ApplicationRecord
    include ActionView::Helpers::SanitizeHelper
    belongs_to :user
    belongs_to :review
    
    has_many :observation_links, dependent: :destroy
    has_many :documents, :through => :observation_links
    has_many :interviews, :through => :observation_links
    has_many :review_measures, :through => :observation_links
    
    def summary
        return strip_tags(self.comments).slice(0, 500) unless self.comments.nil?
    end

    
    def name
        return strip_tags(self.comments).slice(0, 75) unless self.comments.nil?
    end    
    
    def self.icon
        return 'eye'
    end       
end
