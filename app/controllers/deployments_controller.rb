class DeploymentsController < ApplicationController
  respond_to :html

  def new
    @deployment_form = DeploymentForm.new(
      template_id: params[:template_id],
      deployment_target_id: target_id
    )
  end

  def create
    @deployment_form = DeploymentForm.new(params[:deployment_form])
    if @deployment_form.save
      respond_with @deployment_form
    end
  end

  def index
    target = DeploymentTarget.find(target_id)
    @deployments = target.deployments
  end

  private

  def target_id
    params[:deployment_target_id]
  end
end
