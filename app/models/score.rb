class Score < ApplicationRecord

   has_many :score_ranges, dependent: :destroy
   
   public
   
   #get color code based on scoring ranges assigned to this template   
   def get_score_range (score)
      
      s= ScoreRange.new()
      s.color='gainsboro'
      s.name= 'Not Scored'
      s.min=0
      s.max=0
      
      return s if score.nil?
      return s if score < self.score_ranges.minimum(:min) or score > self.score_ranges.maximum(:max)
      
      val = self.score_ranges.where(":score >= min AND :score <= max ", score: score).order(min: :desc).first
      return s if val.nil?
      return val
   end
 
end
