class Meetup < ApplicationRecord
    has_many :comments

    def self.upcoming_meetups
        Meetup.all.order(date_time: :desc).limit(3)
    end


end
