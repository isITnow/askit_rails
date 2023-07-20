require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new name: 'John Doe', email: 'jdoe@example.com', password: 'password' }
  it 'returns user name' do
    expect(user.name).to eq('John Doe')
  end

  it 'returns user email' do
    expect(user.email).to eq('jdoe@example.com')
  end

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user.name=nil
    expect(user).to_not be_valid
  end

  it "is not valid without a email" do
    user.email=nil
    expect(user).to_not be_valid
  end
end
