require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(20) }
    it { should validate_length_of(:email).is_at_least(6).is_at_most(50) }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(20) }
  end
  describe 'associations' do
    it { should have_many(:articles).with_foreign_key(:AuthorId) }
    it { should have_many(:votes).with_foreign_key(:UserId) }
  end
end
