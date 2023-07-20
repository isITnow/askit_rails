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
end
