class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    is_showing = params[:is_showing]
    keyword = params[:keyword]
    @movies = Movie.where(is_showing: is_showing) if is_showing.present?
    return unless keyword.present?

    @movies = Movie.where('name LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%")
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
