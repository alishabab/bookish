require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  include Devise::Test::ControllerHelpers
  before(:each) do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    sign_in @user
  end
  describe 'GET #new of articles' do
    it 'renders the new articles page' do
      get :new, params: { article: {} }
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #index of articles' do
    it 'gets top article and render index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post #create of articles' do
    context 'with valid params' do
      it 'creates a new article' do
        post :create, params: { article: { Title: 'sjdjsbdjj', Text: 'dsjdbsadada' }, category_ids: [@category.id] }
        expect(response).to redirect_to(article_url(Article.first.id))
        expect(response).to have_http_status(302)
        expect(flash[:success]).to match(/Article Created Successfully/)
      end
    end
    context 'with invalid params' do
      it 'renders new template' do
        post :create, params: { article: { Title: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'Delete #destroy of articles' do
    it 'deletes a artice' do
      @article = FactoryBot.create(:article, author: @user, categories: [@category])
      delete :destroy, params: { id: @article.id }
      expect(response).to redirect_to(my_articles_url)
      expect(response).to have_http_status(302)
      expect(flash[:success]).to match(/Article Deleted/)
    end
  end
end
