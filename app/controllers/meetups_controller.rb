class MeetupsController < ApplicationController

    def index
       @meetups = Meetup.all
    end

    def show
       @meetup = Meetup.where(id: params[:id]).first
       
    end


end
