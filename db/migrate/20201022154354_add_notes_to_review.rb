class AddNotesToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :notes, :text
  end
end
