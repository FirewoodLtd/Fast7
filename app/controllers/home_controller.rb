class HomeController < ApplicationController

  def index
    @reviews = current_user.customer.reviews
    
    
    #line chart for project performance over time
    @line_chart_data = []
    current_user.customer.projects.each do |project|
      data= []
      project.reviews.order(:start_date).each do |review|
        data << { "x" => review.stop_date.to_i * 1000, "y" => review.overall_score, "url" => review_url(review)}
      end
      series = {"name" => project.name, "data" => data}
      @line_chart_data << series
    end
    
    
    #bar chart ofr finding status
    @stacked_bar_chart_data = []
    StatusType.all.each do |status|
      @stacked_bar_chart_data << {"name" => status.name, "data" => [current_user.customer.findings.where(:status_type => status).count]}
    end

  
    #funnel chart
    @funnel_chart_data = []
    data=[]
    current_user.customer.action_items.group_by(&:status).each do |status, actions| 
      data <<  [status, actions.count]
    end
    @funnel_chart_data << {"name" => 'status', "data" => data}
    

    #pie chart 1
    @pie_chart_1_data = []
    data=[]
    current_user.customer.documents.group_by(&:is_enabled).each do |status, documents| 
      data <<  {"name" => status ? "Done" : "To Do", "y" =>  documents.count, "sliced" => true}
    end
    @pie_chart_1_data << {"name" => 'status', "data" => data}    


    #pie chart 2
    @pie_chart_2_data = []
    data=[]
    current_user.customer.interviews.group_by(&:is_enabled).each do |status, interviews| 
      data <<  {"name" => status ? "Done" : "To Do", "y" =>  interviews.count, "sliced" => true}
    end
    @pie_chart_2_data << {"name" => 'status', "data" => data}    



    #polar chart 1
    @polar_chart_1_data = []
    data=[]
    current_user.customer.measures.group_by(&:category).first(5).each do |category, measures| 
      @polar_chart_1_data <<  {"name" => category.name, "data" =>  [measures.count], "pointPlacement" => 'on'}
    end
    
  
  end
  
  

  
end
