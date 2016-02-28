class ProjectsController < ApplicationController

  before_filter :require_login, except: [:index, :show]
  # you need to be logged in, except when viewing all projects, or a specific project show page.

  def index
    if params[:title]
      @projects = Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:title]}%")
      # query to search for projects.
    else
      @projects = Project.all
    end

    respond_to do |format|
      format.html
      format.js
      #This code above specifies the ways in which we are able to respond.
    end

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
