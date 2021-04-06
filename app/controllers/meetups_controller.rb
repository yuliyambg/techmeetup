class MeetupsController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
       @meetups = Meetup.all
    end

    def search
      if !params[:search_text].nil? && !params[:search_text].empty?
      @meetups = Meetup.search_meetups(params[:search_text])
      else
        @meetups = []
      end
    end

    def attend
      @meetup = Meetup.find(params[:id])
      @user = User.find(session[:user_id])
      if @meetup.users.include?(@user)
        # flash[:notice] = 'this'
      else
        @meetup.users << @user

        # EventMailer.welcome_email(@user, @meetup).deliver

        #Welcome email
        EventMailer.delay.welcome_email(@user, @meetup)
        #24 hours in advance
        EventMailer.delay(run_at: (@meetup.date_time - 24.hours)).twenty_four_hours_email(@user, @meetup)
        #1 hour in advance
        EventMailer.delay(run_at: (@meetup.date_time - 1.hours)).one_hour_email(@user, @meetup)


      end
      redirect_to meetup_path(@meetup)
    end


    def show
       @meetup = Meetup.where(id: params[:id]).first
       @comment = Comment.new
       @comments = @meetup.comments
    end

    def new
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

end
