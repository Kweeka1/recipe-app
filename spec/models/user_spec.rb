require_relative '../rails_helper'

describe 'User' do
  fixtures :all

  let(:user1) { user(:peter) }

  subject do
    User.create(name: user1.name, email: user1.email, encrypted_password: user1.password)
  end

  before { subject.save }

  context 'Model should be valid' do
    it 'Name should be present' do
      subject.name = nil
      expect(subject.valid?).to be false
    end

    it 'Email should be present' do
      subject.email = nil
      expect(subject.valid?).to be false
    end

    it 'Password should be present' do
      subject.encrypted_password = nil
      expect(subject.valid?).to be false
    end
  end
end
