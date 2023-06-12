class ProjectCertificationType < ApplicationRecord
    belongs_to :project
    belongs_to :certification_type
end
