require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:UserId) }
    it { should validate_presence_of(:ArticleId) }
  end
  describe 'associations' do
    it { should belong_to(:user).with_foreign_key(:UserId) }
    it { should belong_to(:article).with_foreign_key(:ArticleId) }
  end
end
