class ListsController < ApplicationController
#  A user can see all the lists
  def index
    @lists = List.all
  end
  #  A user can see the details of a given list and its name



  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
  end
  #  A user can create a new list

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
