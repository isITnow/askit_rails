require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { create :question }

  describe 'associations' do
    it { should have_many(:answers).class_name('Answer').dependent(:destroy) }
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:question_tags).dependent(:destroy)}
    it { should have_many(:tags).class_name('Tag').through(:question_tags) }
    it { should have_many(:comments).class_name('Comment').dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it { should validate_length_of(:title).is_at_least(2) }
    it { should validate_length_of(:body).is_at_least(2) }
  end

  context "when creating a question" do
    it 'valid with valid attributes' do
      expect(subject).to be_valid
    end

      it 'is not valid without title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  end

  it 'is not valid with a title less than 2 characters long' do
    subject.title = '1'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a body less than 2 characters long' do
    subject.body = '1'
    expect(subject).to_not be_valid
  end
end
