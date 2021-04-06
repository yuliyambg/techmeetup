class User < ApplicationRecord
    has_secure_password
    has_many :meetups_users
    has_many :meetups, through: :meetups_users
    has_many :comments


    validates :first_name, presence:true
    validates :last_name, presence:true
    validates :email, presence:true

    def attending_event(event)
        meetups.include?(event)
    end

end
