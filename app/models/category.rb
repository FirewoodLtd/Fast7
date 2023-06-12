class Category < ApplicationRecord
   has_ancestry
   
   before_save :add_helper_data

   has_many :measures, dependent: :destroy
   
   has_many :category_score_ranges, dependent: :destroy
   has_many :score_ranges, :through => :category_score_ranges
   
   has_many :customer_categories, dependent: :destroy
   
   def path_name
      val=''
      self.path.each do |c|
         val += c.name.strip + '/'
      end
      return val.strip.delete_suffix('/')
   end
   
   def full_name
      return (self.path_name + self.name).strip
   end
   
   def self.icon
      return 'folder'
   end   
   
   def all_measures
      category_ids= self.descendant_ids
      category_ids << self.id
      return Measure.where(category_id: category_ids)
   end
   
   def self.sorted_list
    categories = []
    Category.all.each do |category|
      categories << [ "#{category.code} #{category.path_name}", category.id]
    end
    return categories.sort_by(&:first)      
   end

   private   
   
   def add_helper_data
      #add additional helper data
      self.framework = self.root.name unless self.depth == 0
      self.primary = self.name if self.depth == 1
      self.primary = self.ancestors[1].name if self.depth > 1
   end
  
end
