class MeasureDocumentType < ApplicationRecord
   belongs_to :measure
   belongs_to :document_type
end
