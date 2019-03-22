require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Instance methods' do
    describe '.average_age' do
      it 'returns the average age of astronauts' do
        Astronaut.create(
          name: 'Neil Armstrong',
          age: 37,
          job: 'Commander'
        )
        Astronaut.create(
          name: 'Matt Levy',
          age: 27,
          job: 'Computer Programmer'
        )
        astronauts = Astronaut.all

        expect(astronauts.average_age).to eq(32)
      end
    end

    describe '.total_time_in_space' do
      it 'returns the sum of all missions for that astronaut' do
        neil = Astronaut.create(
          name: 'Neil Armstrong',
          age: 37,
          job: 'Commander'
        )

        neil.missions.create(title: 'Apollo 13', time_in_space: 100)
        neil.missions.create(title: 'Gemini 7', time_in_space: 25)
        neil.missions.create(title: 'Capricorn 4', time_in_space: 50)

        expect(neil.total_time_in_space).to eq(175)
      end

    end
  end
end
