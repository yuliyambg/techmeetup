class CommentsController < ApplicationController
before_action :set_meetup
# skip_before_action :verify_authenticity_token

    def index
        @comments = @meetup.comments
    end

    def new
    end

    def create
        # raise params.inspect

        @comment = @meetup.comments.create(content: params[:comment][:content])

        redirect_to  meetup_path(@meetup)
    end

    private

    def set_meetup
      meetup_id = params[:meetup_id]
      @meetup = Meetup.where(id: meetup_id).first
    end

    # def comment_params
    #     params.require(:comment).permit(:content, :meetup_id)
    #   end

end
