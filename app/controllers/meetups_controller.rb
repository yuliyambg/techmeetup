class MeetupsController < ApplicationController
  before_action :set_upcoming_meetups
  skip_before_action :verify_authenticity_token

    def index
       @meetups = Meetup.all
      #  @upcoming_meetups = Meetup.upcoming_meetups
    end

    def search
      if !params[:search_text].nil? && !params[:search_text].empty?
      @meetups = Meetup.search_meetups(params[:search_text])
      else
        @meetups = []
      end
    end


    def show
       @meetup = Meetup.where(id: params[:id]).first
       @comment = Comment.new
       @comments = @meetup.comments
      #  @upcoming_meetups = Meetup.upcoming_meetups
    end

    def new
      # @upcoming_meetups = Meetup.upcoming_meetups
    end

    def create
      # raise params.inspect
      title = params[:meetup][:title]
      date_time = params[:meetup][:date_time]
      description = params[:meetup][:description]
      image_url = params[:meetup][:image_url]
      link = params[:meetup][:link]
      @meetup = Meetup.create(title: title, date_time: date_time, description: description, image_url: image_url, link: link)
  
      redirect_to :meetups
    end

    private


    def set_upcoming_meetups
      @upcoming_meetups = Meetup.upcoming_meetups
    end

end
