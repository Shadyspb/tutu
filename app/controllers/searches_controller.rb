class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
    if params[:start_station] == params[:finish_station]
      @error = "Станции не могут быть одинаковы."
    else
      @trains = Train.search_by_stations(params[:start_station], params[:finish_station])
      @start_station = RailwayStation.find(params[:start_station])
      @finish_station = RailwayStation.find(params[:finish_station])
    end
  end
end
