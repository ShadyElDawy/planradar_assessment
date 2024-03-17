# # notification_service.rb
# class NotificationService
#     def initialize(configuration)
#       @configuration = configuration
#     end
  
#     def send_notification(message)
#       @configuration.enabled_notification_methods.each do |method|
#         provider = load_notification_provider(method)
#         provider.send_notification(message)
#       end
#     end
  
#     private
  
#     def load_notification_provider(method)
#       case method
#       when :email
#         EmailProvider.new
#       when :sms
#         SMSProvider.new
#       when :push_notification
#         PushNotificationProvider.new
#       else
#         raise NotImplementedError, "Unsupported notification method: #{method}"
#       end
#     end
#   end