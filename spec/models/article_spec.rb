require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:Title) }
    it { should validate_presence_of(:Text) }
    it { should validate_presence_of(:categories) }
    it { should validate_length_of(:Title).is_at_least(3).is_at_most(60) }
    it { should validate_length_of(:Text).is_at_least(6) }
  end
  describe 'associations' do
    it { should belong_to(:author).class_name(:User).with_foreign_key(:AuthorId) }
    it { should have_many(:votes).with_foreign_key(:ArticleId) }
    it { should have_many(:categorizations).dependent(:delete_all) }
    it { should have_many(:categories).through(:categorizations).dependent(:delete_all) }
  end
end
