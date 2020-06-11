require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  include Devise::Test::ControllerHelpers
  before(:each) do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @article = FactoryBot.create(:article, author: @user, categories: [@category])
    sign_in @user
  end

  describe 'Post #upvote of votes' do
    context 'with valid params' do
      it 'creates a vote' do
        post :upvote, params: { article_id: @article.id }
        expect(response).to redirect_to('/')
        expect(response).to have_http_status(302)
      end
    end

    context 'with invalid params' do
      it 'returns no content' do
        post :upvote, params: { article_id: 3 }
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'Post #downvote of votes' do
    it 'delets a vote' do
      @vote = FactoryBot.create(:vote)
      post :downvote, params: { article_id: @article.id }
      expect(response).to redirect_to('/')
      expect(response).to have_http_status(302)
    end
end

end
