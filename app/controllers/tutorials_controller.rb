class TutorialsController < ApplicationController
  def index
    @tutorials = Tutorial.all
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @tutorial = Tutorial.find(params[:id])
    @tutorial.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back
  end
end
