class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
  end

  def index
    @pledges = Pledge.all
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    @pledge.set_reward

      #respond_to do |format| #when the request is posted, below happens.
    if @pledge.save
      redirect_to project_path(@pledge.project), notice: 'Pledge added, thank you! :).'
    else
      redirect_to project_path(@pledge.project), notice: 'The pledge did not save.'
    end

  end

  #def load_project
    #     @project = Project.find(params[:project_id])
    #   end

    #   def load_pledge
    #     @pledge = Pledge.find(params[:id])
    #   end
  # end

  private
  def pledge_params
    params.require(:pledge).permit(:dollar_amount, :project_id)
  end
end
