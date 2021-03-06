require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
      name: 'Hock',
      email: 'hock.tan712@bloc.io',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'instantiates a new user' do
      get :new
      expect(assigns(:user)).to_not be_nil
    end
  end

  describe 'POST create' do
    it 'returns an http redirect' do
      post :create, user: new_user_attributes
      expect(response).to have_http_status(:redirect)
    end

    it 'creates a new user' do
      expect do
        post :create, user: new_user_attributes
      end.to change(User, :count).by(1)
    end

    it 'sets user properly' do
      post :create, user: new_user_attributes
      expect(assigns(:user).name).to eq new_user_attributes[:name]
      expect(assigns(:user).email).to eq new_user_attributes[:email]
      expect(assigns(:user).password).to eq new_user_attributes[:password]
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end

    it 'logs the user in after sign up' do
      post :create, user: new_user_attributes
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end
end
