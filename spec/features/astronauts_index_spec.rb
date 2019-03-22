require 'rails_helper'

RSpec.describe 'Astronauts index page', type: :feature do
  context 'When I visit /astronauts' do
    before(:each) do
      @neil = Astronaut.create(
        name: 'Neil Armstrong',
        age: 37,
        job: 'Commander'
      )
      @matt = Astronaut.create(
        name: 'Matt Levy',
        age: 27,
        job: 'Computer Programmer'
      )

      @neil.missions.create(title: 'Apollo 13', time_in_space: 100)
      @neil.missions.create(title: 'Gemini 7', time_in_space: 25)
      @neil.missions.create(title: 'Capricorn 4', time_in_space: 50)

      @matt.missions.create(title: 'Turing 17', time_in_space: 5)
      @matt.missions.create(title: 'Aries 99', time_in_space: 5)
      @matt.missions.create(title: 'Lexington 45', time_in_space: 5)

      visit astronauts_path
      save_and_open_page
    end

    it 'shows a list of astronaut information' do
      within "#astronaut-#{@neil.id}" do
        expect(page).to have_content('Name: Neil Armstrong')
        expect(page).to have_content('Age: 37')
        expect(page).to have_content('Job: Commander')
        expect(page).to have_content('Total Time in Space: 175 days')
      end

      within "#astronaut-#{@matt.id}" do
        expect(page).to have_content('Name: Matt Levy')
        expect(page).to have_content('Age: 27')
        expect(page).to have_content('Job: Computer Programmer')
        expect(page).to have_content('Total Time in Space: 15 days')
      end
    end

    it 'shows average age of all astronauts' do
      within "#average-age" do
        expect(page).to have_content('Average age: 32')
      end
    end

    it "show a list of the space missions' in alphabetical order for each astronaut." do
      within "#astronaut-#{@neil.id}-missions" do
        neil_missions_alphabetical = "Apollo 13, Capricorn 4, Gemini 7"

        expect(page).to have_content(neil_missions_alphabetical)
      end

      within "#astronaut-#{@matt.id}-missions" do
        matt_missions_alphabetical = "Aries 99, Lexington 45, Turing 17"

        expect(page).to have_content(matt_missions_alphabetical)
      end
    end
  end
end
