class CustomerCategory < ApplicationRecord
    belongs_to :customer
    belongs_to :category
end
