module Scalable
  extend ActiveSupport::Concern

  def deployment_attributes=(attrs)
    self.deployment = attrs
  end

  def deployment
    BaseResource.new({ count: 1 })
  end

end
