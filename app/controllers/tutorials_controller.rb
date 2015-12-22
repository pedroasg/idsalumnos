class TutorialsController < ApplicationController
  def index
    @tutorials = Tutorial.all
  end

  def upvote
    @tutorial = Tutorial.find(params[:id])
    @tutorial.upvote_from current_user
    redirect_to :back
  end

  def downvote
    @tutorial = Tutorial.find(params[:id])
    @tutorial.downvote_from current_user
    redirect_to :back
  end
end
