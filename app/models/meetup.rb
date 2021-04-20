class Meetup < ApplicationRecord
    has_many :comments
    has_many :meetups_users
    has_many :users, through: :meetups_users

    scope :search_meetups, -> (search_text) {  where("title LIKE ?", "#{search_text}%") }
    scope :past_events, -> { where("date_time < ?", "#{Time.now.utc}")}
    scope :upcoming_events, -> { where("date_time >= ?", "#{Time.now.utc}")}

    # def self.upcoming_meetups
        # Meetup.all.order(date_time: :desc).limit(3)
    # end

    # def self.popular_events
    #     joins(:meetups_users).group("meetups.title").order(count_all: :desc).limit(3)
    # end

    def passed_event?
        date_time < Time.now.utc
    end

    def number_of_users_attending
        self.users.count
    end


end
