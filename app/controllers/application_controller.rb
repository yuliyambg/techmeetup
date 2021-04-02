class ApplicationController < ActionController::Base

    helper_method :upcoming_meetups

    def upcoming_meetups
      @upcoming_meetups = Meetup.upcoming_meetups
    end
    
end
