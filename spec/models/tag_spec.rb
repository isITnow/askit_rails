require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { Tag.new title: "foo" }

  describe 'associations' do
    it { should have_many(:question_tags).dependent(:destroy)}
    it { should have_many(:questions).class_name('Question').through(:question_tags) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end
end