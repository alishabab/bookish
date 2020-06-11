require 'rails_helper'

RSpec.describe Categorization, type: :model do
  describe 'associations' do
    it { should belong_to(:article) }
    it { should belong_to(:category) }
  end
end
