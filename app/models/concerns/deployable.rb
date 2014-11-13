module Deployable
  extend ActiveSupport::Concern

  def service_defs
    if is_a? Template
      images
    else
      services
    end
  end
end
