require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe "role" do
    context "when not specified" do
      it "has basic role as default" do
        expect(subject.role).to eq('basic')
      end
    end
    context "when specified as admin" do
      subject { build(:user, role: 2) }
      it "has admin role" do
        expect(subject.role).to eq('admin')
      end
    end
    context "when specified as moderator" do
      subject { build(:user, role: 1) }
      it "has moderator role" do
        expect(subject.role).to eq('moderator')
      end
    end
  end

  describe "attributes" do
    it { should define_enum_for(:role) }
    it { should have_secure_password }
  end

  describe 'associations' do
    it { should have_many(:questions).class_name('Question').dependent(:destroy) }
    it { should have_many(:answers).class_name('Answer').dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email) }
  end

  context "when creating a user" do
    it "is valid with valid attributes" do
      expect(subject.valid?).to eq(true)
    end

    it "is not valid without a name" do
      subject.name=nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email=nil
      expect(subject).to_not be_valid
    end
  end
end

