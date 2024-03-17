module Notification
    class BaseStrategy
      def notify(ticket = nil)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
end