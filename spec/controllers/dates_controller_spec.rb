require 'rails_helper'

RSpec.describe DatesController, type: :controller do
  login_user

  describe 'GET #update' do
    it 'returns http success' do
      get :update, params: { date: '01-01-2017' }
      expect(response).to have_http_status(:redirect)
      expect(session[:current_date]).to eq('01-01-2017')
    end
  end
end