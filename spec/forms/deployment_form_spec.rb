require 'spec_helper'

describe DeploymentForm do

  it { should respond_to :template_id }
  it { should respond_to :template_id= }
  it { should respond_to :deployment_target_id }
  it { should respond_to :deployment_target_id= }

  describe '#save' do
    let(:deployment_form) do
      described_class.new(
        template_id: 1,
        deployment_target_id: 2
      )
    end

    subject { deployment_form.save }

    it 'creates the deployment' do
      expect(Deployment).to receive(:create).with(
        template_id: 1,
        deployment_target_id: 2
      )
      subject
    end
  end

end
