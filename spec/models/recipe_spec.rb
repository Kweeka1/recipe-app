require_relative '../rails_helper'

describe 'Recipe' do
  fixtures :all

  let(:recipe1) { recipe(:pasta) }
  let(:user1) { user(:peter) }

  subject do
    Recipe.create(
      name: recipe1.name,
      preparation_time: recipe1.preparation_time,
      cooking_time: recipe1.cooking_time,
      description: recipe1.description,
      public: recipe1.public,
      user: user1
    )
  end

  before { subject.save }

  context 'Model should be valid' do
    it 'Name should be present' do
      subject.name = nil
      expect(subject.valid?).to be false
    end

    it 'preparation_time should be a number' do
      subject.preparation_time = 'xyz'
      expect(subject.valid?).to be false
    end

    it 'cooking_time should be a number' do
      subject.cooking_time = 'xyz'
      expect(subject.valid?).to be false
    end

    it 'description should be present' do
      subject.description = nil
      expect(subject.valid?).to be false
    end

    it 'public should be a boolean' do
      subject.public = 'yes'
      expect(subject.valid?).to be false
    end
  end
end
