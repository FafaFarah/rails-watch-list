class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # create a bookmark
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to list_path(list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
