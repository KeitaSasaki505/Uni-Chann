class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  def edit

  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
