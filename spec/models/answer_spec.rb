require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { build(:answer) } 

  describe 'associations' do
    it { should have_many(:comments).class_name('Comment') }
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:question).class_name('Question') }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(5) }
  end

  context "when creating an answer" do
    it 'valid with valid attributes' do
      expect(subject).to be_valid
    end
    
    it 'is not valid without body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end
    
    it 'is not valid with a body less than 5 characters long' do
      subject.body = '1234'
      expect(subject).to_not be_valid
    end
  end
end