ReviewMeasure.delete_all
ReviewCategory.delete_all
ReviewSubCategory.delete_all
Review.delete_all

ScoreRange.delete_all
Score.delete_all

DocumentType.delete_all
Document.delete_all

TemplateCategory.delete_all
Template.delete_all

Evidence.delete_all
Measure.delete_all
SubCategory.delete_all
Category.delete_all

Project.delete_all
ProjectType.delete_all

User.delete_all
Role.delete_all
Engagement.delete_all
Customer.delete_all

OccupationType.delete_all
StatusType.delete_all


# lookup date -----------------------------------------
Role.create(:name => "Firewood Admin")
Role.create(:name => "Customer Admin")
Role.create(:name => "Reviewer")


ProjectType.create(:name => "Program")
ProjectType.create(:name => "Portfolio")
ProjectType.create(:name => "Project")


OccupationType.create(:name => "Agile Analyst", :tags => "IIBA")
OccupationType.create(:name => "Business Analyst", :tags => "IIBA")
OccupationType.create(:name => "Business Architect", :tags => "IIBA")
OccupationType.create(:name => "Business change manager", :tags => "MSP")
OccupationType.create(:name => "Business Owner", :tags => "SAFe")
OccupationType.create(:name => "Business Process Analyst", :tags => "IIBA")
OccupationType.create(:name => "Business Requirements Analyst", :tags => "IIBA")
OccupationType.create(:name => "Business Systems Analyst", :tags => "IIBA")
OccupationType.create(:name => "Business User", :tags => "PRINCE2")
OccupationType.create(:name => "Change authority", :tags => "PRINCE2")
OccupationType.create(:name => "Customer", :tags => "PRINCE2, SAFe")
OccupationType.create(:name => "Customer representative", :tags => "PRINCE2, Agile")
OccupationType.create(:name => "Decision Analyst/Business Intelligence Analyst", :tags => "IIBA")
OccupationType.create(:name => "Delivery team quality assurance", :tags => "PRINCE2, Agile")
OccupationType.create(:name => "Enterprise Architect", :tags => "SAFe, IIBA")
OccupationType.create(:name => "Epic Owner", :tags => "SAFe")
OccupationType.create(:name => "Executive", :tags => "PRINCE2")
OccupationType.create(:name => "Functional Analyst", :tags => "IIBA")
OccupationType.create(:name => "Product Manager", :tags => "SAFe")
OccupationType.create(:name => "Product Owner", :tags => "SAFe")
OccupationType.create(:name => "Programme manager", :tags => "MSP")
OccupationType.create(:name => "Programme office", :tags => "MSP")
OccupationType.create(:name => "Project assurance", :tags => "PRINCE2")
OccupationType.create(:name => "Project manager", :tags => "APM, PRINCE2")
OccupationType.create(:name => "Project support", :tags => "PRINCE2")
OccupationType.create(:name => "Release Train Engineer", :tags => "SAFe")
OccupationType.create(:name => "Scrum Master", :tags => "Scrum, SAFe")
OccupationType.create(:name => "Senior responsible owner", :tags => "MSP")
OccupationType.create(:name => "Senior supplier", :tags => "PRINCE2")
OccupationType.create(:name => "Senior user", :tags => "PRINCE2")
OccupationType.create(:name => "Service Request Analyst", :tags => "IIBA")
OccupationType.create(:name => "Solution Architect/Engineer", :tags => "SAFe")
OccupationType.create(:name => "Solution Manager", :tags => "SAFe")
OccupationType.create(:name => "Solution Train Engineer", :tags => "SAFe")
OccupationType.create(:name => "Sponsor", :tags => "APM")
OccupationType.create(:name => "Subject Matter Expert")
OccupationType.create(:name => "Subject Matter Expert (Customer)", :tags => "PRINCE2, Agile")
OccupationType.create(:name => "Subject Matter Expert (Supplier)", :tags => "PRINCE2, Agile")
OccupationType.create(:name => "Supplier")
OccupationType.create(:name => "Supplier representative", :tags => "PRINCE2, Agile")
OccupationType.create(:name => "System Architect/Engineer", :tags => "SAFe")
OccupationType.create(:name => "Systems Analyst", :tags => "IIBA")
OccupationType.create(:name => "Team manager (Workstream lead)", :tags => "PRINCE2")
OccupationType.create(:name => "Team member (Workstream member)", :tags => "APM, PRINCE2, Scrum, SAFe")


StatusType.create(:name => "Critical", :priority => 1, :description => "To increase the likelihood of a successful outcome it is of the greatest importance that the programme should take action immediately")
StatusType.create(:name  => "Essential", :priority => 2, :description => "Essential (do by)	To increase the likelihood of a successful outcome the programme should take action in the near future")
StatusType.create(:name => "Recommended", :priority => 3, :description => "The programme should benefit from the uptake of this recommendation")


DocumentType.create(:name => "Acceptance criteria")
DocumentType.create(:name => "Actions log")
DocumentType.create(:name => "Assurance Plan")
DocumentType.create(:name => "Benefits Management Approach")
DocumentType.create(:name => "Benefits plan")
DocumentType.create(:name => "Budget and Forecasting")
DocumentType.create(:name => "Business Case")
DocumentType.create(:name => "Business Continuity Plan")
DocumentType.create(:name => "Business Justification")
DocumentType.create(:name => "Change control approach")
DocumentType.create(:name => "Change management process")
DocumentType.create(:name => "Communication management approach")
DocumentType.create(:name => "Contract schedules")
DocumentType.create(:name => "Design documents")
DocumentType.create(:name => "Health & Safety plan")
DocumentType.create(:name => "Implementation plan")
DocumentType.create(:name => "Issues Register")
DocumentType.create(:name => "Lessons Learned register")
DocumentType.create(:name => "Market Analysis")
DocumentType.create(:name => "Organisational policies and procedures")
DocumentType.create(:name => "Procurement plan")
DocumentType.create(:name => "Product breakdown structure")
DocumentType.create(:name => "Product description")
DocumentType.create(:name => "Project board reports")
DocumentType.create(:name => "Project Initiation Document")
DocumentType.create(:name => "Project plan")
DocumentType.create(:name => "Project product description")
DocumentType.create(:name => "Project reports")
DocumentType.create(:name => "Project requirements")
DocumentType.create(:name => "Project scope")
DocumentType.create(:name => "QA/Testing plan")
DocumentType.create(:name => "Quality management approach")
DocumentType.create(:name => "Quality register")
DocumentType.create(:name => "RACI table")
DocumentType.create(:name => "Release management plan")
DocumentType.create(:name => "Requirements")
DocumentType.create(:name => "Risk management approach")
DocumentType.create(:name => "Risk Register")
DocumentType.create(:name => "Risk Strategy")
DocumentType.create(:name => "Solution design")
DocumentType.create(:name => "Stakeholder engagement plan")
DocumentType.create(:name => "Sustainability plan")
DocumentType.create(:name => "Terms of Reference")
DocumentType.create(:name => "Training plan")
DocumentType.create(:name => "Other")



score=Score.create(:name => "APM Standard")
ScoreRange.create(:name => "Best", :min => 10, :max => 10, :color => '#4E91CD', :score => score)
ScoreRange.create(:name => "Good", :min => 8, :max => 9, :color => '#9FCE66', :score => score)
ScoreRange.create(:name => "Acceptable", :min => 6, :max => 7, :color => '#9FCE66', :score => score)
ScoreRange.create(:name => "Poor", :min => 3, :max => 5, :color => '#FFD203', :score => score)
ScoreRange.create(:name => "Red", :min => 0, :max => 2, :color => '#E60F63', :score => score)

score=Score.create(:name => "Firewood Pass/Fail")
ScoreRange.create(:name => "Pass", :min => 7, :max => 10, :color => '#9FCE66', :score => score)
ScoreRange.create(:name => "Fail", :min => 0, :max => 7, :color => '#E60F63', :score => score)


# users -----------------------------------------
user = User.new
user.first_name= "Tayyab"
user.last_name= "Jamil"
user.is_enabled=true
user.role=Role.find_by(name: 'Firewood Admin')
user.email = 'tayyab.jamil@firewoodltd.com'
user.password = 'firewood'
user.save!


user = User.new
user.first_name= "Roy"
user.last_name= "Millard"
user.is_enabled=true
user.role=Role.find_by(name: 'Reviewer')
user.email = 'roy.millard@firewoodltd.com'
user.password = 'firewood'
user.save!


user = User.new
user.first_name= "Todd"
user.last_name= "Scarola"
user.is_enabled=true
user.role=Role.find_by(name: 'Firewood Admin')
user.email = 'todd.scarola@firewoodltd.com'
user.password = 'firewood'
user.save!
# users -----------------------------------------

customer= Customer.new
customer.name = 'Sample Customer'
customer.is_enabled =true
customer.save!



project = Project.new
project.customer=Customer.find_by(name: 'Sample Customer')
project.project_type= ProjectType.find_by(name: 'Project')
project.name = 'Sample Project'
project.description = 'Autogenerated project for system development and testing'
project.budget =5000
project.save!

=begin
engagement = Engagement.new
engagement.customer=Customer.find_by(name: 'Sample Customer')
engagement.lead_firewood_user = User.find_by(last_name: 'Jamil')
engagement.lead_customer_user =User.find_by(last_name: 'Scarola')
engagement.start_date = DateTime.current - 10.days
engagement.stop_date = DateTime.current + 30.days
engagement.is_enabled =true
engagement.reference_cd ="PO# ABC123"
engagement.save!


review = Review.new
review.project=project
review.engagement=engagement
review.score= Score.find_by(name: 'APM Statndard')
review.save!
=end