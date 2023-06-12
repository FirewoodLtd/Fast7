class CustomerTemplate < ApplicationRecord
    belongs_to :customer
    belongs_to :template
end
