require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(5) }
  end

  describe 'associations' do
    it { should have_many(:comments).class_name('Comment') }
    it { should belong_to(:user).class_name('User') }
  end
end