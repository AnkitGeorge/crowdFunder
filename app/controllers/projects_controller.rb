class ProjectsController < ApplicationController

  before_filter :require_login, except: [:index, :show]
  # you need to be logged in, except when viewing all projects, or a specific project show page.

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    #@comment = Comment.new(user: current_user, project: @project)
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :owner_id, :funding_goal, :project_end_date)
  end

end
