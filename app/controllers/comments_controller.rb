class CommentsController < ApplicationController
before_action :set_meetup
skip_before_action :verify_authenticity_token

    def index
        @comments = @meetup.comments
    end

    def new
    end

    def create
        # raise params.inspect
        #debugger 
        comment = @meetup.comments.new
        comment.user_id = current_user.id
        comment.update(comment_params)
        comment.save
        # @comment = @meetup.comments.create(comment_params)

        redirect_to  meetup_path(@meetup)
    end

    private

    def set_meetup
      meetup_id = params[:meetup_id]
      @meetup = Meetup.where(id: meetup_id).first
    end

    def comment_params
        params.require(:comment).permit(:content, :meetup_id, :user_id)
    end

end
