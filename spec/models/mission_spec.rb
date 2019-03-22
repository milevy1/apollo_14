require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'Instance methods' do
    describe '.sort_alphabetical' do
      it 'returns missions alphabetical' do
        apollo = Mission.create(title: 'Apollo 13', time_in_space: 100)
        gemini = Mission.create(title: 'Gemini 7', time_in_space: 25)
        capricorn = Mission.create(title: 'Capricorn 4', time_in_space: 50)

        expected =  [apollo, capricorn, gemini]

        expect(Mission.sort_alphabetical).to eq(expected)
      end
    end
  end
end
