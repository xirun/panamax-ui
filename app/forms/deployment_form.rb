require 'active_model'

class DeploymentForm
  include ActiveModel::Model

  attr_accessor :template_id, :deployment_target_id

  delegate :images, :images_attributes=, to: :template

  def template
    @template ||= Template.find(template_id)
  end

  def save
    #todo this could probably deployment_target.deployments.create
    Deployment.create(
      template_id: template_id,
      deployment_target_id: deployment_target_id,
    )
  end

end
