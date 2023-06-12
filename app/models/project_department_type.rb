class ProjectDepartmentType < ApplicationRecord
    belongs_to :project
    belongs_to :department_type
    
end
