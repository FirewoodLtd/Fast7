#create measures and map to APM template
#APM Template -----------------------------------------------------------------------------------------------------------
template= Template.create(:name => 'APM June 2016', :description => 'APM Toolkit: Measures for Assuring Projects')


category = Category.create(:code => "1", :name => "Client and scope")
TemplateCategory.create(:template =>template, :category =>category)


subcategory = SubCategory.create(:category => category, :code => "1.1", :name => "Managing the baseline")

measure = Measure.create(:sub_category => subcategory, :code => "1.1.1",  :name => "Documented, approved baseline scope")



Evidence.create(:measure => measure, :code => "1.1.1.1", :name => "Clear roles and responsibilities have been defined for authorisation of baseline documents")
Evidence.create(:measure => measure, :code => "1.1.1.2", :name => "Documented outline of basic project scope")


measure = Measure.create(:sub_category => subcategory, :code => "1.1.2",  :name => "Change control process for baseline scope established")
Evidence.create(:measure => measure, :code => "1.1.2.1", :name => "Processes, standards and tools for defining and managing change to the baseline")


subcategory = SubCategory.create(:category => category, :code => "1.2", :name => "Documenting client criteria")

measure = Measure.create(:sub_category => subcategory, :code => "1.2.1",  :name => "Objectives")
Evidence.create(:measure => measure, :code => "1.2.1.1", :name => "Clear and unambiguous objectives")


measure = Measure.create(:sub_category => subcategory, :code => "1.2.2",  :name => "Priorities and success criteria")
Evidence.create(:measure => measure, :code => "1.2.2.1", :name => "Agreed priorities and success criteria")


measure = Measure.create(:sub_category => subcategory, :code => "1.2.3",  :name => "Dependencies")
Evidence.create(:measure => measure, :code => "1.2.3.1", :name => "Agreed dependencies")


measure = Measure.create(:sub_category => subcategory, :code => "1.2.4",  :name => "Constraints and assumptions")
Evidence.create(:measure => measure, :code => "1.2.4.1", :name => "Agreed constraints and assumptions")


subcategory = SubCategory.create(:category => category, :code => "1.3", :name => "Defining and documenting project scope")

measure = Measure.create(:sub_category => subcategory, :code => "1.3.1",  :name => "Project scope, requirements and specifications")
Evidence.create(:measure => measure, :code => "1.3.1.1", :name => "Documents provide agreed definition of project scope")
Evidence.create(:measure => measure, :code => "1.3.1.2", :name => "Documents provide agreed definition of project requirements")
Evidence.create(:measure => measure, :code => "1.3.1.3", :name => "Definition is to a sufficient level of detail for effective control and management")


measure = Measure.create(:sub_category => subcategory, :code => "1.3.2",  :name => "Estimated schedule and milestones")
Evidence.create(:measure => measure, :code => "1.3.2.1", :name => "Documents provide agreed definition of estimated schedule and milestones")
Evidence.create(:measure => measure, :code => "1.3.2.2", :name => "Definition is to a sufficient level of detail for effective control and management")


measure = Measure.create(:sub_category => subcategory, :code => "1.3.3",  :name => "Estimated costs and budget")
Evidence.create(:measure => measure, :code => "1.3.3.1", :name => "Documents provide agreed definition of estimated costs and budget")
Evidence.create(:measure => measure, :code => "1.3.3.2", :name => "Definition is to a sufficient level of detail for effective control and management")


measure = Measure.create(:sub_category => subcategory, :code => "1.3.4",  :name => "Scope change control")
Evidence.create(:measure => measure, :code => "1.3.4.1", :name => "Documents provide agreed definition of control of scope changes")
Evidence.create(:measure => measure, :code => "1.3.4.2", :name => "Definition is to a sufficient level of detail for effective control and management")


subcategory = SubCategory.create(:category => category, :code => "1.4", :name => "Establishing the project environment")

measure = Measure.create(:sub_category => subcategory, :code => "1.4.1",  :name => "Corporate policies")
Evidence.create(:measure => measure, :code => "1.4.1.1", :name => "Monitoring processes and documents show monitoring of corporate policies")
Evidence.create(:measure => measure, :code => "1.4.1.2", :name => "Response to these topics, where applicable")


measure = Measure.create(:sub_category => subcategory, :code => "1.4.2",  :name => "Legislation")
Evidence.create(:measure => measure, :code => "1.4.2.1", :name => "Monitoring processes and documents show monitoring of corporate legislation")
Evidence.create(:measure => measure, :code => "1.4.2.2", :name => "Response to these topics, where applicable")


measure = Measure.create(:sub_category => subcategory, :code => "1.4.3",  :name => "Audit and compliance")
Evidence.create(:measure => measure, :code => "1.4.3.1", :name => "Monitoring processes and documents show monitoring of audit and compliance")
Evidence.create(:measure => measure, :code => "1.4.3.2", :name => "Response to these topics, where applicable")


measure = Measure.create(:sub_category => subcategory, :code => "1.4.4",  :name => "Industry regulation")
Evidence.create(:measure => measure, :code => "1.4.4.1", :name => "Monitoring processes and documents show monitoring of industry regulation")
Evidence.create(:measure => measure, :code => "1.4.4.2", :name => "Response to these topics, where applicable")


measure = Measure.create(:sub_category => subcategory, :code => "1.4.5",  :name => "Risk appetite")
Evidence.create(:measure => measure, :code => "1.4.5.1", :name => "Monitoring processes and documents show monitoring of risk appetite")
Evidence.create(:measure => measure, :code => "1.4.5.2", :name => "Response to these topics, where applicable")


subcategory = SubCategory.create(:category => category, :code => "1.5", :name => "Agreeing and documenting project deliverables")

measure = Measure.create(:sub_category => subcategory, :code => "1.5.1",  :name => "Internal agreement on deliverables")
Evidence.create(:measure => measure, :code => "1.5.1.1", :name => "Agreed and documented definition of deliverables")
Evidence.create(:measure => measure, :code => "1.5.1.2", :name => "Technical and service definitions")
Evidence.create(:measure => measure, :code => "1.5.1.3", :name => "Milestones")


measure = Measure.create(:sub_category => subcategory, :code => "1.5.2",  :name => "Contractual schedule")
Evidence.create(:measure => measure, :code => "1.5.2.1", :name => "Contractual schedules of deliverables")


measure = Measure.create(:sub_category => subcategory, :code => "1.5.3",  :name => "Acceptance processes")
Evidence.create(:measure => measure, :code => "1.5.3.1", :name => "Acceptance processes")


measure = Measure.create(:sub_category => subcategory, :code => "1.5.4",  :name => "Links to contractual requirements")
Evidence.create(:measure => measure, :code => "1.5.4.1", :name => "Links to contractual requirements: Payment provisions")
Evidence.create(:measure => measure, :code => "1.5.4.2", :name => "Links to contractual requirements: Completion")
Evidence.create(:measure => measure, :code => "1.5.4.3", :name => "Links to contractual requirements: Liabilities")


subcategory = SubCategory.create(:category => category, :code => "1.6", :name => "Defining and managing expected benefits")

measure = Measure.create(:sub_category => subcategory, :code => "1.6.1",  :name => "Stated and quantified in business case")
Evidence.create(:measure => measure, :code => "1.6.1.1", :name => "Business case contains stated and quantified benefits")
Evidence.create(:measure => measure, :code => "1.6.1.2", :name => "Clear and unambiguous")
Evidence.create(:measure => measure, :code => "1.6.1.3", :name => "Measurement of achievement")
Evidence.create(:measure => measure, :code => "1.6.1.4", :name => "Accountability for realisation")
Evidence.create(:measure => measure, :code => "1.6.1.5", :name => "Realisation processes")
Evidence.create(:measure => measure, :code => "1.6.1.6", :name => "Links to success criteria")


measure = Measure.create(:sub_category => subcategory, :code => "1.6.2",  :name => "Benefits management structures")
Evidence.create(:measure => measure, :code => "1.6.2.1", :name => "Business case contains stated and quantified benefits")
Evidence.create(:measure => measure, :code => "1.6.2.2", :name => "Clear and unambiguous")
Evidence.create(:measure => measure, :code => "1.6.2.3", :name => "Measurement of achievement")
Evidence.create(:measure => measure, :code => "1.6.2.4", :name => "Accountability for realisation")
Evidence.create(:measure => measure, :code => "1.6.2.5", :name => "Realisation processes")
Evidence.create(:measure => measure, :code => "1.6.2.6", :name => "Links to success criteria")


measure = Measure.create(:sub_category => subcategory, :code => "1.6.3",  :name => "Measurement and control of realisation of benefits")
Evidence.create(:measure => measure, :code => "1.6.3.1", :name => "Business case contains stated and quantified benefits")
Evidence.create(:measure => measure, :code => "1.6.3.2", :name => "Clear and unambiguous")
Evidence.create(:measure => measure, :code => "1.6.3.3", :name => "Measurement of achievement")
Evidence.create(:measure => measure, :code => "1.6.3.4", :name => "Accountability for realisation")
Evidence.create(:measure => measure, :code => "1.6.3.5", :name => "Realisation processes")
Evidence.create(:measure => measure, :code => "1.6.3.6", :name => "Links to success criteria")


measure = Measure.create(:sub_category => subcategory, :code => "1.6.4",  :name => "Appropriate individual is accountable for realisation")
Evidence.create(:measure => measure, :code => "1.6.4.1", :name => "Business case contains stated and quantified benefits")
Evidence.create(:measure => measure, :code => "1.6.4.2", :name => "Clear and unambiguous")
Evidence.create(:measure => measure, :code => "1.6.4.3", :name => "Measurement of achievement")
Evidence.create(:measure => measure, :code => "1.6.4.4", :name => "Accountability for realisation")
Evidence.create(:measure => measure, :code => "1.6.4.5", :name => "Realisation processes")
Evidence.create(:measure => measure, :code => "1.6.4.6", :name => "Links to success criteria")


measure = Measure.create(:sub_category => subcategory, :code => "1.6.5",  :name => "Survival of accountability")
Evidence.create(:measure => measure, :code => "1.6.5.1", :name => "Business case contains stated and quantified benefits")
Evidence.create(:measure => measure, :code => "1.6.5.2", :name => "Clear and unambiguous")
Evidence.create(:measure => measure, :code => "1.6.5.3", :name => "Measurement of achievement")
Evidence.create(:measure => measure, :code => "1.6.5.4", :name => "Accountability for realisation")
Evidence.create(:measure => measure, :code => "1.6.5.5", :name => "Realisation processes")
Evidence.create(:measure => measure, :code => "1.6.5.6", :name => "Links to success criteria")



subcategory = SubCategory.create(:category => category, :code => "1.7", :name => "Agreeing and documenting acceptance process and success criteria")

measure = Measure.create(:sub_category => subcategory, :code => "1.7.1",  :name => "Requirements for successful achievement")
Evidence.create(:measure => measure, :code => "1.7.1.1", :name => "Acceptance processes")


measure = Measure.create(:sub_category => subcategory, :code => "1.7.2",  :name => "Acceptance criteria and process")
Evidence.create(:measure => measure, :code => "1.7.2.1", :name => "Acceptance processes")
Evidence.create(:measure => measure, :code => "1.7.2.2", :name => "Acceptance criteria")


measure = Measure.create(:sub_category => subcategory, :code => "1.7.3",  :name => "Project success criteria defined")
Evidence.create(:measure => measure, :code => "1.7.3.1", :name => "Metrics of project success")


measure = Measure.create(:sub_category => subcategory, :code => "1.7.4",  :name => "Links to contractual requirements")
Evidence.create(:measure => measure, :code => "1.7.4.1", :name => "Contractual requirements schedule")



subcategory = SubCategory.create(:category => category, :code => "1.8", :name => "Clarifying sponsor and client obligations")

measure = Measure.create(:sub_category => subcategory, :code => "1.8.1",  :name => "Sponsor has been identified at a senior level")
Evidence.create(:measure => measure, :code => "1.8.1.1", :name => "Defined role of the project sponsor Senior level in organisation. Authority. Accountability. Continuity. Actively involved in project")


measure = Measure.create(:sub_category => subcategory, :code => "1.8.2",  :name => "Role of sponsor has been defined")
Evidence.create(:measure => measure, :code => "1.8.2.1", :name => "Defined role of the project sponsor Senior level in organisation. Authority. Accountability. Continuity. Actively involved in project")


measure = Measure.create(:sub_category => subcategory, :code => "1.8.3",  :name => "Sponsor is accountable for delivery of business case")
Evidence.create(:measure => measure, :code => "1.8.3.1", :name => "Defined role of the project sponsor Senior level in organisation. Authority. Accountability. Continuity. Actively involved in project")


measure = Measure.create(:sub_category => subcategory, :code => "1.8.4",  :name => "Sponsor takes active interest in project")
Evidence.create(:measure => measure, :code => "1.8.4.1", :name => "Defined role of the project sponsor Senior level in organisation. Authority. Accountability. Continuity. Actively involved in project")


measure = Measure.create(:sub_category => subcategory, :code => "1.8.5",  :name => "Client obligations have been established and are managed")
Evidence.create(:measure => measure, :code => "1.8.5.1", :name => "Defined client obligations Clear client obligations. Management of client obligations")


subcategory = SubCategory.create(:category => category, :code => "1.9", :name => "Client readiness for acceptance and implementation of solution")

measure = Measure.create(:sub_category => subcategory, :code => "1.9.1",  :name => "Organisation’s technical commissioning programme")
Evidence.create(:measure => measure, :code => "1.9.1.1", :name => "Commissioning processes")
Evidence.create(:measure => measure, :code => "1.9.1.2", :name => "Implementation programme")


measure = Measure.create(:sub_category => subcategory, :code => "1.9.2",  :name => "Client’s commissioning processes")
Evidence.create(:measure => measure, :code => "1.9.2.1", :name => "Commissioning processes")


measure = Measure.create(:sub_category => subcategory, :code => "1.9.3",  :name => "Client’s business change processes")
Evidence.create(:measure => measure, :code => "1.9.3.1", :name => "Change management process")
Evidence.create(:measure => measure, :code => "1.9.3.2", :name => "Business change processes")


measure = Measure.create(:sub_category => subcategory, :code => "1.9.4",  :name => "Sufficient client staff resources available for commissioning")
Evidence.create(:measure => measure, :code => "1.9.4.1", :name => "Sufficient staff and equipment resources")


measure = Measure.create(:sub_category => subcategory, :code => "1.9.5",  :name => "Client’s technical resources and interfaces")
Evidence.create(:measure => measure, :code => "1.9.5.1", :name => "Sufficient staff and equipment resources")


subcategory = SubCategory.create(:category => category, :code => "1.10", :name => "Management of requirements")

measure = Measure.create(:sub_category => subcategory, :code => "1.10.1",  :name => "Change control process")
Evidence.create(:measure => measure, :code => "1.10.1.1", :name => "Requirement change control processes")


measure = Measure.create(:sub_category => subcategory, :code => "1.10.2",  :name => "User involvement and feedback")
Evidence.create(:measure => measure, :code => "1.10.2.1", :name => "User involvement")


measure = Measure.create(:sub_category => subcategory, :code => "1.10.3",  :name => "Statement of revised needs and requirements")
Evidence.create(:measure => measure, :code => "1.10.3.1", :name => "Consistency of changes with project scope")


measure = Measure.create(:sub_category => subcategory, :code => "1.10.4",  :name => "Links to benefits management")
Evidence.create(:measure => measure, :code => "1.10.4.1", :name => "Revised implementation and other plans")





















#APM Template Catregory 3
#------------------------------------

category = Category.create(:code => "3", :name => "Planning and scheduling")
TemplateCategory.create(:template =>template, :category =>category)

subcategory = SubCategory.create(:category => category, :code => "3.1", :name => "Integrated set of approaches")

measure = Measure.create(:sub_category => subcategory, :code => "3.1.1",  :name => "Planning and scheduling process")
Evidence.create(:measure => measure, :code => "3.1.1.1", :name => "Documented")
Evidence.create(:measure => measure, :code => "3.1.1.2", :name => "Integrated with other disciplines and techniques")


measure = Measure.create(:sub_category => subcategory, :code => "3.1.2",  :name => "Work breakdown structure")
Evidence.create(:measure => measure, :code => "3.1.2.1", :name => "Represents the project scope")
Evidence.create(:measure => measure, :code => "3.1.2.2", :name => "Aligns to cost, planning and organisation")
Evidence.create(:measure => measure, :code => "3.1.2.3", :name => "Identifies necessary controls")
Evidence.create(:measure => measure, :code => "3.1.2.4", :name => "Accountabilities have been identified and allocated")


measure = Measure.create(:sub_category => subcategory, :code => "3.1.3",  :name => "Tools")
Evidence.create(:measure => measure, :code => "3.1.3.1", :name => "Schedule is managed through a recognised and appropriate software package")



subcategory = SubCategory.create(:category => category, :code => "3.2", :name => "Schedule integrity")

measure = Measure.create(:sub_category => subcategory, :code => "3.2.1",  :name => "Baseline")
Evidence.create(:measure => measure, :code => "3.2.1.1", :name => "Agreed and recorded")
Evidence.create(:measure => measure, :code => "3.2.1.2", :name => "Identifies critical path, major activities and milestones; mapped to the governance structure")
Evidence.create(:measure => measure, :code => "3.2.1.3", :name => "Reviewed at appropriate intervals")


measure = Measure.create(:sub_category => subcategory, :code => "3.2.2",  :name => "Schedule durations and milestones")
Evidence.create(:measure => measure, :code => "3.2.2.1", :name => "Appropriate estimates of activities and resources")
Evidence.create(:measure => measure, :code => "3.2.2.2", :name => "Credible")
Evidence.create(:measure => measure, :code => "3.2.2.3", :name => "Milestones defined")


measure = Measure.create(:sub_category => subcategory, :code => "3.2.3",  :name => "Assurance")
Evidence.create(:measure => measure, :code => "3.2.3.1", :name => "Scheduled process")
Evidence.create(:measure => measure, :code => "3.2.3.2", :name => "Uses baseline and appropriate benchmarks")
Evidence.create(:measure => measure, :code => "3.2.3.3", :name => "Schedule check software used")


measure = Measure.create(:sub_category => subcategory, :code => "3.2.4",  :name => "Deliverables")
Evidence.create(:measure => measure, :code => "3.2.4.1", :name => "Agreed and recorded")
Evidence.create(:measure => measure, :code => "3.2.4.2", :name => "Ownership of schedule and accountabilities agreed")


measure = Measure.create(:sub_category => subcategory, :code => "3.2.5",  :name => "Close-out and handover")
Evidence.create(:measure => measure, :code => "3.2.5.1", :name => "Commissioning requirements agreed and recorded")
Evidence.create(:measure => measure, :code => "3.2.5.2", :name => "Pre- and post-transition planning")
Evidence.create(:measure => measure, :code => "3.2.5.3", :name => "Handover activities scheduled")



subcategory = SubCategory.create(:category => category, :code => "3.3", :name => "Project Controls")

measure = Measure.create(:sub_category => subcategory, :code => "3.3.1",  :name => "Reporting")
Evidence.create(:measure => measure, :code => "3.3.1.1", :name => "Formal reporting process")
Evidence.create(:measure => measure, :code => "3.3.1.2", :name => "Reports made to appropriate levels of organisation")
Evidence.create(:measure => measure, :code => "3.3.1.3", :name => "Relevant content")


measure = Measure.create(:sub_category => subcategory, :code => "3.3.2", :name => "Meetings")
Evidence.create(:measure => measure, :code => "3.3.2.1",:name => "Receive reports")
Evidence.create(:measure => measure, :code => "3.3.2.2", :name => "Review performance, progress and cost")
Evidence.create(:measure => measure, :code => "3.3.2.3", :name => "Assess future activity and intended progress")
Evidence.create(:measure => measure, :code => "3.3.2.4", :name => "Provide stage approval")
Evidence.create(:measure => measure, :code => "3.3.2.5", :name => "Take action")


measure = Measure.create(:sub_category => subcategory, :code => "3.3.3", :name => "Data integrity and information flow")
Evidence.create(:measure => measure, :code => "3.3.3.1", :name => "The right data from the right sources")
Evidence.create(:measure => measure, :code => "3.3.3.2", :name => "Objective and independent")
Evidence.create(:measure => measure, :code => "3.3.3.3", :name => "Integrity of forecasting and estimating")


measure = Measure.create(:sub_category => subcategory, :code => "3.3.4", :name => "Early warning and change impacts")
Evidence.create(:measure => measure, :code => "3.3.4.1", :name => "Formal early warning and change process")
Evidence.create(:measure => measure, :code => "3.3.4.2", :name => "Early involvement of planning team")
Evidence.create(:measure => measure, :code => "3.3.4.3", :name => "Involvement of stakeholders in early warning process")
Evidence.create(:measure => measure, :code => "3.3.4.4", :name => "Planning scenarios modelled for assessment of impacts")
Evidence.create(:measure => measure, :code => "3.3.4.5", :name => "Regular update of schedules to reflect changes")





#APM Template Catregory 10
#------------------------------------


category = Category.create(:code => "10", :name => "Governance")
TemplateCategory.create(:template =>template, :category =>category)

subcategory = SubCategory.create(:category => category, :code => "10.1", :name => "Management and governance of projects")

measure = Measure.create(:sub_category => subcategory, :code => "10.1.1",  :name => "Board approval of project")
Evidence.create(:measure => measure, :code => "10.1.1.1", :name => "Business case approved")
Evidence.create(:measure => measure, :code => "10.1.1.2", :name => "Approval given at appropriate level in organisation")

Evidence.create(:measure => measure, :code => "10.1.1.3", :name => "Board has overall responsibility for governance of project")


measure = Measure.create(:sub_category => subcategory, :code => "10.1.2",  :name => "Responsibility and accountability for delivery")
Evidence.create(:measure => measure, :code => "10.1.2.1", :name => "Defined accountability for delivery")
Evidence.create(:measure => measure, :code => "10.1.2.2", :name => "Continuation of accountability")


measure = Measure.create(:sub_category => subcategory, :code => "10.1.3",  :name => "Structured management organisation")
Evidence.create(:measure => measure, :code => "10.1.3.1", :name => "Clarity of roles and responsibilities")
Evidence.create(:measure => measure, :code => "10.1.3.2", :name => "Process and controls are defined")

Evidence.create(:measure => measure, :code => "10.1.3.3", :name => "Project organisation including governance")


measure = Measure.create(:sub_category => subcategory, :code => "10.1.4",  :name => "Business case")
Evidence.create(:measure => measure, :code => "10.1.4.1", :name => "Business case")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.1.5",  :name => "Project plan")
Evidence.create(:measure => measure, :code => "10.1.5.1", :name => "Project plan")


 

subcategory = SubCategory.create(:category => category, :code => "10.2", :name => "Sponsorship and project direction")

measure = Measure.create(:sub_category => subcategory, :code => "10.2.1",  :name => "Business case")
Evidence.create(:measure => measure, :code => "10.2.1.1", :name => "Project sponsor retains accountability for and ownership of business case")



measure = Measure.create(:sub_category => subcategory, :code => "10.2.2",  :name => "Representation of project")
Evidence.create(:measure => measure, :code => "10.2.2.1", :name => "Project sponsor represents project at senior level")

Evidence.create(:measure => measure, :code => "10.2.2.2", :name => "Project sponsor consults with project manager giving effective direction")



 

measure = Measure.create(:sub_category => subcategory, :code => "10.2.3",  :name => "Continuity of sponsorship")
Evidence.create(:measure => measure, :code => "10.2.3.1", :name => "Accountabilities continue on change of project sponsor")


 
measure = Measure.create(:sub_category => subcategory, :code => "10.2.4",  :name => "Senior awareness of project status")
Evidence.create(:measure => measure, :code => "10.2.4.1", :name => "Project sponsor reports project status to senior stakeholders")


 
measure = Measure.create(:sub_category => subcategory, :code => "10.2.5",  :name => "Continuing review of links between project and organisation’s strategic requirements")
Evidence.create(:measure => measure, :code => "10.2.5.1", :name => "Project sponsor reviews continuing links to organisation’s strategy")


 
subcategory = SubCategory.create(:category => category, :code => "10.3", :name => "Sponsors")

measure = Measure.create(:sub_category => subcategory, :code => "10.3.1",  :name => "Suitably senior sponsor appointed by board or delegated authority")
Evidence.create(:measure => measure, :code => "10.3.1.1", :name => "Appointed by board or delegated authority")
Evidence.create(:measure => measure, :code => "10.3.1.2", :name => "Appropriate competencies")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.3.2",  :name => "Availability, and attendance at appropriate meetings")
Evidence.create(:measure => measure, :code => "10.3.2.1", :name => "Allocates sufficient time to project")
Evidence.create(:measure => measure, :code => "10.3.2.2", :name => "Chairs and attends project board")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.3.3",  :name => "Reporting by sponsor")
Evidence.create(:measure => measure, :code => "10.3.3.1", :name => "Reports on project progress to organisation board")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.3.4",  :name => "Able to obtain and allocate resources")
Evidence.create(:measure => measure, :code => "10.3.4.1", :name => "Authorised to allocate organisation’s resources")



measure = Measure.create(:sub_category => subcategory, :code => "10.3.5",  :name => "Communication between sponsor and project manager")
Evidence.create(:measure => measure, :code => "10.3.5.1", :name => "Meets at appropriate intervals with project manager.")
Evidence.create(:measure => measure, :code => "10.3.5.2", :name => "Continuing awareness of user requirements")


subcategory = SubCategory.create(:category => category, :code => "10.4", :name => "Administration of governance arrangements")


measure = Measure.create(:sub_category => subcategory, :code => "10.4.1",  :name => "Robust project governance arrangements")
Evidence.create(:measure => measure, :code => "10.4.1.1", :name => "Documented governance arrangements")
Evidence.create(:measure => measure, :code => "10.4.1.2", :name => "Appropriate methodologies and controls")
Evidence.create(:measure => measure, :code => "10.4.1.3", :name => "Governance arrangements are applied through project life cycle")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.4.2",  :name => "Staged authorisation and review plans for business case")

Evidence.create(:measure => measure, :code => "10.4.2.1", :name => "Approved project management plan and schedule")
Evidence.create(:measure => measure, :code => "10.4.2.2", :name => "Agreed business case authorisation, review and approval points")
Evidence.create(:measure => measure, :code => "10.4.2.3", :name => "Decisions made at authorisation points are recorded and communicated")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.4.3",  :name => "Internal reporting structures and plan")
Evidence.create(:measure => measure, :code => "10.4.3.1", :name => "Effective disclosure of project information to all levels of project")
Evidence.create(:measure => measure, :code => "10.4.3.2", :name => "Culture of continuous improvement")
Evidence.create(:measure => measure, :code => "10.4.3.3", :name => "Communications plan, linked to communications strategy")
Evidence.create(:measure => measure, :code => "10.4.3.4", :name => "Inclusion of users and wider stakeholders in communications plan")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.4.4",  :name => "Delegated authority")
Evidence.create(:measure => measure, :code => "10.4.4.1", :name => "Appropriate delegation of authority for effective governance and administration")


measure = Measure.create(:sub_category => subcategory, :code => "10.4.5",  :name => "Disclosure and whistleblowing policies")
Evidence.create(:measure => measure, :code => "10.4.5.1", :name => "Documented policy supportive of whistleblowers")



subcategory = SubCategory.create(:category => category, :code => "10.5", :name => "Project status reporting")

 

measure = Measure.create(:sub_category => subcategory, :code => "10.5.1",  :name => "Reporting of project status to interested stakeholders and others")
Evidence.create(:measure => measure, :code => "10.5.1.1", :name => "Agreed structure and metrics for reporting project status to stakeholders")
Evidence.create(:measure => measure, :code => "10.5.1.2", :name => " Reports provide appropriate level of detail to recipient")


 
measure = Measure.create(:sub_category => subcategory, :code => "10.5.2",  :name => "Reporting of forecasts to board at appropriate points, including at approval stages")
Evidence.create(:measure => measure, :code => "10.5.2.1", :name => "Agreed structure for preparation of project forecasts")
Evidence.create(:measure => measure, :code => "10.5.2.2", :name => "Forecasts provide appropriate level of detail to recipient")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.5.3",  :name => "Reporting of project progress and risk to the board")
Evidence.create(:measure => measure, :code => "10.5.3.1", :name => "Project progress and risk reported at planned intervals to appropriate levels of organisation")
Evidence.create(:measure => measure, :code => "10.5.3.2", :name => "Progress reports act as base of corrective action plan")
Evidence.create(:measure => measure, :code => "10.5.3.3", :name => "Risk management processes are consistent with those of organisation")
Evidence.create(:measure => measure, :code => "10.5.3.4", :name => "Project risks form part of organisation’s main risk register")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.5.4",  :name => "Documented escalation processes for risks and issues")
Evidence.create(:measure => measure, :code => "10.5.4.1", :name => "Project issue and risk registers maintained")
Evidence.create(:measure => measure, :code => "10.5.4.2", :name => "Provision to escalate issues and risks to appropriate levels of organisation")
Evidence.create(:measure => measure, :code => "10.5.4.3", :name => "Escalation process consistent with contractual requirements")


 

subcategory = SubCategory.create(:category => category, :code => "10.6", :name => "Stakeholder management")

measure = Measure.create(:sub_category => subcategory, :code => "10.6.1",  :name => "Identification and engagement of stakeholders")
Evidence.create(:measure => measure, :code => "10.6.1.1", :name => "Policies to identify and engage stakeholders at appropriate level")
Evidence.create(:measure => measure, :code => "10.6.1.2", :name => "All stakeholders are identified, including contractors")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.6.2",  :name => "Communications strategy and plan")
Evidence.create(:measure => measure, :code => "10.6.2.1", :name => "Communications strategy encourages effective stakeholder engagement as needed")
Evidence.create(:measure => measure, :code => "10.6.2.2", :name => "Records and logs of communications material and contacts")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.6.3",  :name => "Alignment of project with interests of stakeholders")
Evidence.create(:measure => measure, :code => "10.6.3.1", :name => "Evidence of alignment of project with interests of stakeholders")
Evidence.create(:measure => measure, :code => "10.6.3.2", :name => "Policies to manage non-alignment or misalignment")



subcategory = SubCategory.create(:category => category, :code => "10.7", :name => "Project manager and staff")
measure = Measure.create(:sub_category => subcategory, :code => "10.7.1",  :name => "Terms of reference and project organisation")
Evidence.create(:measure => measure, :code => "10.7.1.1", :name => "Terms of reference and job descriptions are consistent with project organisation and objectives")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.7.2",  :name => "Project manager(s)")
Evidence.create(:measure => measure, :code => "10.7.2.1", :name => "Possess(es) suitable qualifications and experience")
Evidence.create(:measure => measure, :code => "10.7.2.2", :name => "Report(s) to sponsor")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.7.3",  :name => "Technical and project office staff")
Evidence.create(:measure => measure, :code => "10.7.3.1", :name => "Possess suitable qualifications and experience")
Evidence.create(:measure => measure, :code => "10.7.3.2", :name => "Sufficiently resourced")
Evidence.create(:measure => measure, :code => "10.7.3.3", :name => "Suitably qualified and experienced")



subcategory = SubCategory.create(:category => category, :code => "10.8", :name => "Issue escalation and conflict management")

measure = Measure.create(:sub_category => subcategory, :code => "10.8.1",  :name => "Issue and escalation procedure and records")
Evidence.create(:measure => measure, :code => "10.8.1.1", :name => "Approved issue and escalation procedure")
Evidence.create(:measure => measure, :code => "10.8.1.2", :name => "Consistent with contractual requirements")
Evidence.create(:measure => measure, :code => "10.8.1.3", :name => "Appropriate records maintained of risks, issues and actions, including escalation")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.8.2",  :name => "Escalation reporting")
Evidence.create(:measure => measure, :code => "10.8.2.1", :name => "Issues and risks are reported to appropriate level in organisation for resolution, including board")
Evidence.create(:measure => measure, :code => "10.8.2.2", :name => "Provision for action to be taken within contractual time limits")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.8.3",  :name => "Conflict management processes")
Evidence.create(:measure => measure, :code => "10.8.3.1", :name => "Policies for recording and managing conflict")
Evidence.create(:measure => measure, :code => "10.8.3.2", :name => "Policies for escalating and resolving conflict")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.8.4",  :name => "Conflict management definition and policies for resolution")
Evidence.create(:measure => measure, :code => "10.8.4.1", :name => "Policies for recording and managing conflict")
Evidence.create(:measure => measure, :code => "10.8.4.2", :name => "Policies for escalating and resolving conflict")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.8.5",  :name => "RAID (risks, assumptions, issues, dependencies) log maintained")
Evidence.create(:measure => measure, :code => "10.8.5.1", :name => " RAID (risks, assumptions, issues, dependencies) log maintained")


measure = Measure.create(:sub_category => subcategory, :code => "10.8.6",  :name => "Significant project risk recorded on organisation’s risk register")
Evidence.create(:measure => measure, :code => "10.8.6.1", :name => "Significant project risk recorded on organisation main risk register")


 

subcategory = SubCategory.create(:category => category, :code => "10.9", :name => "Business readiness for change")
measure = Measure.create(:sub_category => subcategory, :code => "10.9.1",  :name => "Continuing relevance of project and business case")
Evidence.create(:measure => measure, :code => "10.9.1.1", :name => "Business case reflects business need")
Evidence.create(:measure => measure, :code => "10.9.1.2", :name => "Organisational strategy supports continuance of project")



measure = Measure.create(:sub_category => subcategory, :code => "10.9.2",  :name => "Commissioning processes and plans established")
Evidence.create(:measure => measure, :code => "10.9.2.1", :name => "Commissioning plans and processes established for technical and business aspects")
Evidence.create(:measure => measure, :code => "10.9.2.2", :name => "Training plans developed")
Evidence.create(:measure => measure, :code => "10.9.2.3", :name => "Changed business processes developed")
Evidence.create(:measure => measure, :code => "10.9.2.4", :name => "Business case supports requirement for business change")


 

subcategory = SubCategory.create(:category => category, :code => "10.10", :name => "Independent assessment and scrutiny")

measure = Measure.create(:sub_category => subcategory, :code => "10.10.1",  :name => "Independent assurance and scrutiny processes")
Evidence.create(:measure => measure, :code => "10.10.1.1", :name => "Assurance and scrutiny activity at appropriate points in project")
Evidence.create(:measure => measure, :code => "10.10.1.2", :name => "Assurance and scrutiny is independent of project")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.10.2",  :name => "Assurance reporting to board")
Evidence.create(:measure => measure, :code => "10.10.2.1", :name => "Board seeks independent assurance")
Evidence.create(:measure => measure, :code => "10.10.2.2", :name => "Assurance reports are made to appropriate level of project and organisation")



measure = Measure.create(:sub_category => subcategory, :code => "10.10.3",  :name => "Assurance recommendations actioned")
Evidence.create(:measure => measure, :code => "10.10.3.1", :name => "Responsibility for action on recommendations is assigned")
Evidence.create(:measure => measure, :code => "10.10.3.2", :name => "Follow-up to ensure that assurance recommendations have been actioned")



measure = Measure.create(:sub_category => subcategory, :code => "10.10.4",  :name => "Assurance at appropriate stage gates of project")
Evidence.create(:measure => measure, :code => "10.10.4.1", :name => "Assurance activity scheduled to inform stage gate decision making")


 
subcategory = SubCategory.create(:category => category, :code => "10.11", :name => "Project closure")


measure = Measure.create(:sub_category => subcategory, :code => "10.11.1",  :name => "Closure of the project is planned")
Evidence.create(:measure => measure, :code => "10.11.1.1", :name => "Consistent with contractual requirements")
Evidence.create(:measure => measure, :code => "10.11.1.2", :name => "Planned project early close-down process")
Evidence.create(:measure => measure, :code => "10.11.1.3", :name => "Post-closure continuing obligations identified and recorded")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.11.2",  :name => "Early termination is agreed by the board or delegated authority")
Evidence.create(:measure => measure, :code => "10.11.2.1", :name => "Agreed by board or delegated authority")
Evidence.create(:measure => measure, :code => "10.11.2.2", :name => "Contractual and legal impacts identified and assessed")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.11.3",  :name => "Post-project evaluation(PPE) and benefits realisation review")
Evidence.create(:measure => measure, :code => "10.11.3.1", :name => "Preparation for PPE from project outset")
Evidence.create(:measure => measure, :code => "10.11.3.2", :name => "Benefits achieved quantified and measured against business case")
Evidence.create(:measure => measure, :code => "10.11.3.3", :name => "Outcomes from PPE and benefits review are disseminated usefully within the organisation")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.11.4",  :name => "Resolution of project and contractual matters")
Evidence.create(:measure => measure, :code => "10.11.4.1", :name => "Documented discussions and agreements to resolve contractual matters at completion")
Evidence.create(:measure => measure, :code => "10.11.4.2", :name => "Planned and economical wind-down of project resources and facilities")


 

measure = Measure.create(:sub_category => subcategory, :code => "10.11.5",  :name => "Documented contractual acceptance by client")
Evidence.create(:measure => measure, :code => "10.11.5.1", :name => "Agreed acceptance processes are consistent with contractual requirements")
Evidence.create(:measure => measure, :code => "10.11.5.2", :name => "Acceptance is consistent with project deliverables")
Evidence.create(:measure => measure, :code => "10.11.5.3", :name => "Formal acceptance documentation with agreed defect and snag lists")
Evidence.create(:measure => measure, :code => "10.11.5.4", :name => "Incentive for contractor to complete outstanding works or services")
