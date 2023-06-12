class ScoreRange < ApplicationRecord
   belongs_to :score
   
   has_many :category_score_ranges, dependent: :destroy
   has_many :categories, :through => :category_score_ranges
   
end
