module ApplicationHelper

    def comments_disposition
        [
          'Negative',
          'Neutral',
          'Positive'
        ]
    end
    
    
    def action_item_status
        [
          ['Not Started', 'red'],
          ['In Progress', 'green'],
          ['Complete', 'blue'],
          ['To Be Agreed', 'salmon']
        ]
    end    
    
    
    def customer_tier
        [
          'free',
          'team',
          'enterprise'
        ]
    end    
    
end
