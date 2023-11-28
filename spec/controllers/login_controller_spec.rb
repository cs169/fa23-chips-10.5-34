# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  shared_examples 'authenticates and redirects to root' do
    it 'redirects to URL after trying to start authentication session' do
      get action
      expect(response).to redirect_to(root_url)
      expect(session[:current_user_id]).not_to be_nil
    end
  end

  before do
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  describe '#login' do
    it 'renders the login template' do
      get :login
      expect(response).to render_template('login')
    end
  end

  describe '#google_oauth2' do
    let(:action) { :google_oauth2 }

    it_behaves_like 'authenticates and redirects to root'
  end

  describe '#github' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    end

    let(:action) { :github }

    it_behaves_like 'authenticates and redirects to root'
  end

  describe '#logout' do
    it 'logs out current user' do
      session[:current_user_id] = 1
      get :logout
      expect(response).to redirect_to(root_path)
      expect(session[:current_user_id]).to be_nil
      expect(flash[:notice]).to eq('You have successfully logged out.')
    end
  end

  describe '#logged_in_already' do
    let(:action) { :login }

    context 'when user is already logged in' do
      before { session[:current_user_id] = 1 }

      it 'redirects to profile' do
        get action
        expect(response).to redirect_to(user_profile_path)
        expect(flash[:notice]).to eq('You are already logged in. Logout to switch accounts.')
      end
    end

    context 'when user is not logged in' do
      it 'renders login template' do
        get action
        expect(response).to render_template('login')
      end
    end
  end
end
