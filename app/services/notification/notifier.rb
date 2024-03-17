# app/services/notification/notifier.rb
module Notification
    class Notifier
        attr_reader :strategies
  
      #we only have email for now, we can add more in future
        def initialize(strategies = { email: EmailStrategy.new })
            @strategies = strategies
        end
  
        def notify(ticket = nil, *selected_strategies)
            selected_strategies = @strategies.keys if selected_strategies.empty? # Default is all strategies if none provided
            selected_strategies.each { |strategy| @strategies[strategy].notify(ticket) if @strategies.key?(strategy) }
        end
    end
end
  