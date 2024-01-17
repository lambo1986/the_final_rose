class OutingContestantsController < ApplicationController
  def destroy
    @outing_contestant = OutingContestant.find_by(outing_id: params[:id], contestant_id: params[:format])
    @outing_contestant.destroy
    redirect_to "/outings/#{@outing_contestant.outing_id}"
  end
end
