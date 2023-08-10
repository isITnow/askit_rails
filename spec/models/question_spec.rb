require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { User.new name: 'John Doe', email: 'jdoe1@example.com',
                                        password: 'password', password_confirmation: 'password' }
  let(:question) { Question.new title: 'test Title', body: 'test body' }

  it 'return question title' do
    question.user = user
    expect(question.title).to eq('test Title')
  end

  it 'valid with valid attributes' do
    question.user = user
    expect(question).to be_valid
  end

  it 'is not valid without title' do
    question.user = user
    question.title = nil
    expect(question).to_not be_valid
  end

  it 'is not valid with a title less than 2 characters long' do
    question.title = '1'
    expect(question).to_not be_valid
  end

  it 'is not valid without body' do
    question.user = user
    question.body = nil
    expect(question).to_not be_valid
  end

  it 'is not valid with a body less than 2 characters long' do
    question.body = '1'
    expect(question).to_not be_valid
  end

  describe 'associations' do
    it { should have_many(:answers).class_name('Answer').dependent(:destroy) }
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:question_tags).dependent(:destroy)}
    it { should have_many(:tags).class_name('Tag').through(:question_tags) }
    it { should have_many(:comments).class_name('Comment') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it { should validate_length_of(:title).is_at_least(2) }
    it { should validate_length_of(:body).is_at_least(2) }
  end
end
