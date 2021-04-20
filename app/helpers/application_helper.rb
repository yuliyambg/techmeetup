module ApplicationHelper

    def upcoming_meetups
        # Meetup.all.order(date_time: :desc).limit(3)
        Meetup.upcoming_events.limit(3)
    end

    def popular_events
        # Meetup.joins(:meetups_users).group("meetups.title").order(count_all: :desc).limit(3)
        Meetup.upcoming_events.joins(:meetups_users).group("meetups.title").order(count_all: :desc).limit(3)
    end


    def past_events
        Meetup.past_events
    end

end
