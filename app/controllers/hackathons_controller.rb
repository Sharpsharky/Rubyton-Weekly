class HackathonsController < ApplicationController
  def index
    @hackathons_all = Hackathon.all.order(start_date: :desc)
    if @hackathons_all.length > 1
      @hackathons_all_previous = @hackathons_all.slice(1, @hackathons_all.length)
    else 
      @hackathons_all_previous = []
    end
  end

  def create
  end

  def show
    @hackathon = Hackathon.find(params[:id])
  end
end
