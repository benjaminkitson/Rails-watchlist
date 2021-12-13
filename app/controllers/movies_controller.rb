class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_by_title(params[:query])
    else
      @movies = Movie.all
    end
  end
end
