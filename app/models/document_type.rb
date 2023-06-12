class DocumentType < ApplicationRecord
   has_many :documents
   
   has_many :measure_document_types
   has_many :measures, :through  => :measure_document_types
   
end
