class ApplicationController < ActionController::Base
    helper_method :current_user
    # helper_method :upcoming_meetups

    # def upcoming_meetups
    #   @upcoming_meetups = Meetup.upcoming_meetups
    # end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

end
