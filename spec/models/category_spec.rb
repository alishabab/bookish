require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_uniqueness_of(:name) }
  end
  describe 'associations' do
    it { should have_many(:categorizations) }
    it { should have_many(:articles).through(:categorizations) }
  end
end
