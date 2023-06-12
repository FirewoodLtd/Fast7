class Project < ApplicationRecord
  belongs_to :customer
  belongs_to :project_type
  belongs_to :industry_type
  belongs_to :life_cycle_type
  
  has_many :project_impact_types, dependent: :destroy
  has_many :project_department_types, dependent: :destroy
  has_many :project_certification_types, dependent: :destroy
  
  has_many :impact_types, :through  => :project_impact_types
  has_many :department_types, :through  => :project_department_types
  has_many :certification_types, :through  => :project_certification_types
  
  has_many :reviews, dependent: :destroy
  
  def self.icon
    return 'briefcase'
  end
  
  def status_text
   return self.is_enabled ? "Open" : "Closed"
  end
  
  def status_color
    return self.is_enabled ? "#FF6B6B" : "#666666"
  end     

  def active_review
    return self.reviews.where(:is_enabled => true).first()
  end
  
  def last_review
    begin
      review=self.reviews.where(:is_enabled => false).order(stop_date: :desc).first
      return nil if review.stop_date.nil?
      return review
    rescue
      return nil
    end
  end
  
end
