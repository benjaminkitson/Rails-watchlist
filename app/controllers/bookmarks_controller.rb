class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  #  A user can see the details of a given bookmark and its name

  def show
    @bookmark = Bookmark.find(params[:id])
  end
  #  A user can create a new bookmark

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @list = List.find(params[:list_id])
  end

  def create
    @movies = Movie.all
    @movie = Movie.find(strongparams[:movie_id])
    @list = List.find(params[:list_id])
    @comment = strongparams[:comment]
    @bookmark = Bookmark.new(movie: @movie, list: @list, comment: @comment)
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end

  def strongparams
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
