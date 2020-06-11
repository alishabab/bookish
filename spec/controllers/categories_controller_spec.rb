require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers
  before(:each) do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @article = FactoryBot.create(:article, author: @user, categories: [@category])
    sign_in @user
  end

  describe 'GET #show of categories' do
    it 'gets the articles from that category' do
      get :show, params: { id: @category.id }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
