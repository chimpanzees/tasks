class TasksController < ApplicationController
  
  before_filter :login_required
  before_filter { params[:id] && @task = Task.find(params[:id]) }
  
  def index
    params[:view] ||= 'mine'
    
    case params[:view]
    when 'mine'
      @tasks = current_user.tasks.active
    when 'today'
      @tasks = current_user.tasks.today.active
    when 'completed'
      @tasks = current_user.tasks.completed
    when 'unassigned'
      @tasks = Task.unassigned.active
    when 'project'
      @project = Project.find(params[:project])
      @tasks = @project.tasks.active
    when 'user'
      @user = User.find(params[:user])
      @tasks = @user.tasks.active
    else
      @tasks = Task.active
    end
    
    @tasks = @tasks.includes(:project, :user)
  end
  
  def create
    @task = Task.new(params[:task])
    @task.reporting_user = current_user
    if @task.save
      redirect_to request.referer, :notice => "Task has been added successfully"
    else
      redirect_to request.referer, :alert => "Your task could not be added at this time"
    end
  end
  
  def update
    if @task.update_attributes(params[:task])
      redirect_to @task, :notice => "Task details have been updated successfully"
    else
      render :action => "show"
    end
  end
  
  def destroy
    @task.destroy
    redirect_to root_path, :notice => "Task has been removed successfully"
  end
  
  def complete
    @task.mark_as_completed_by(current_user)
    render :nothing => true
  end
  
end
