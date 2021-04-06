class EventMailer < ApplicationMailer
    default from: "from@example.com"


    def welcome_email(user,event)
        @user = user
        @event = event
        mail(to: @user.email, subject: 'Welcome Email')
      end
    
      def twenty_four_hours_email(user,event)
        @user = user
        @event = event
        mail(to: @user.email, subject: '24 Hours Email')
      end
    
      def one_hour_email(user,event)
        @user = user
        @event = event
        mail(to: @user.email, subject: 'One Hour Email')
      end

      
end
