class ProjectImpactType < ApplicationRecord
    belongs_to :project
    belongs_to :impact_type
end
