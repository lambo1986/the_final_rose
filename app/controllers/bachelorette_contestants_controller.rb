class BacheloretteContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
  end

  def show
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestant = Contestant.find(params[:id])
  end
end
