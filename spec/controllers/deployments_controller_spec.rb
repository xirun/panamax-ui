require 'spec_helper'

describe DeploymentsController do
  describe 'GET #new' do
    let(:fake_template) { double(:fake_template, id: 8) }
    let(:fake_deployment_form) { double(:fake_deployment_form) }

    before do
      Template.stub(:find).and_return(fake_template)
      DeploymentForm.stub(:new).with(
        template_id: fake_template.id,
        deployment_target_id: '7'
      ).and_return(fake_deployment_form)

      get :new, deployment_target_id: 7
    end

    it 'assigns the template' do
      expect(assigns(:template)).to eq fake_template
    end

    it 'assigns the deployment_form object' do
      expect(assigns(:deployment_form)).to eq fake_deployment_form
    end

    it 'renders the new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:fake_deployment_form) { double(:fake_deployment_form) }
    let(:create_params) do
      {
        deployment_target_id: '7',
        template_id: '8'
      }.stringify_keys
    end

    before do
      DeploymentForm.stub(:new).with(create_params).and_return(fake_deployment_form)
    end

    it 'calls save on the deployment form' do
      expect(fake_deployment_form).to receive(:save)
      post :create, deployment_form: create_params, deployment_target_id: 7
    end
  end
end
