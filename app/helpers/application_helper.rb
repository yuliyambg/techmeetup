module ApplicationHelper

    def upcoming_meetups
        Meetup.all.order(date_time: :desc).limit(3)
    end

    def popular_events
        Meetup.joins(:meetups_users).group("meetups.title").order(count_all: :desc).limit(3)
    end

end
