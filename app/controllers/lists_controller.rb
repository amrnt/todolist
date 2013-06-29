class ListsController < ApplicationController

  before_filter :authenticate_user!, except: :show

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
    unless @list.is_public
      if user_signed_in? && @list.user == current_user
        @list = current_user.lists.find(params[:id])
        @tasks = @list.tasks
      else
        redirect_to root_path, notice: "unauthorized"
      end
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def create
    @list = current_user.lists.new(params[:list])
    if @list.save
      redirect_to @list, notice: "created"
    else
      redirect_to root_path, notice: "somthing went wrong"
    end
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to @list, notice: "updated"
    else
      redirect_to root_path, notice: "somthing went wrong"
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    if @list.destroy
      redirect_to root_path, notice: "destroyed"
    else
      redirect_to root_path, notice: "somthing went wrong"
    end    
  end
end
