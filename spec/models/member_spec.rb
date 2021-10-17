require 'rails_helper'

RSpec.describe Member, type: :model do
  subject { Member.new(name: "Dyllan", surname: "Cullingworth", email: "mmdyllan@gmail.com", birthday: 26.years.ago, games_played: 0, current_rank: Member.count + 1)}

  before { subject.save }

  describe 'Name' do
    it 'should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Surname' do
    it 'should be present' do
      subject.surname = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Email' do
    it 'should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should be a valid email' do
      subject.email = 'notAValidEmail'
      expect(subject).to_not be_valid
    end
  end

  describe 'birthday' do
    it 'should be present' do
      subject.birthday = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Games Played' do
    it 'should be present' do
      subject.games_played = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Current Rank' do
    it 'should be present' do
      subject.current_rank = nil
      expect(subject).to_not be_valid
    end
  end
end