class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
  end

  def new
  end

  def create
   @movie = Movie.new(movie_params)
    #added lines are here!
   if @movie.save
       flash[:notice] = "#{@movie.title} was successfully created."
   else
       flash[:notice] = "Title cannot be empty! New movie cannot be created!"
   end

    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    if !(movie_params[:title].empty?)
      @movie.update!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
    else
      flash[:notice] = "Title cannot be empty! New movie cannot be updated!"
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end


  private
  def movie_params
    params.require(:movie).permit(:title, :rating, :release_date)
  end


end
