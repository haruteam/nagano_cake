class Admin::GenresController < ApplicationController
  
  def create
    @genre=Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    end
  end
  
  def index
    @genres=Genre.all
  end
  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
