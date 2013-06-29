class TasksController < ApplicationController

# /lists/:list_id/tasks/:id/edit(.:format)tasks#edit
  def edit
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end

# /lists/:list_id/tasks(.:format)         tasks#create
  def create
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
      redirect_to @list, notice: "task created"
    else
      redirect_to @list, notice: "somthing went wrong"
    end
  end

# /lists/:list_id/tasks/:id(.:format)     tasks#update
  def update
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @list, notice: "task updated"
    else
      redirect_to @list, notice: "somthing went wrong"
    end
  end

# /lists/:list_id/tasks/:id(.:format)     tasks#destroy
  def destroy
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      redirect_to @list, notice: "destroyed"
    else
      redirect_to @list, notice: "somthing went wrong"
    end 
  end
end
