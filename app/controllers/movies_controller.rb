class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def summary  #This is the summaries for just a single movie
    movie = Movie.find(params[:id])
    render json: movie, serializer: MovieSummarySerializer
  end

  def summaries  #Get the sumaries for all the movies
    movie = Movie.all
    render json: movies, each_serializer: MovieSummarySerializer #Specifying that for each of the movies, just use the serializer and generate a summary
  end

  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
