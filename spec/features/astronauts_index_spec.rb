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
      visit astronauts_path
    end

    it 'shows a list of astronaut information' do
      within "#astronaut-#{@neil.id}" do
        expect(page).to have_content('Name: Neil Armstrong')
        expect(page).to have_content('Age: 37')
        expect(page).to have_content('Job: Commander')
      end

      within "#astronaut-#{@matt.id}" do
        expect(page).to have_content('Name: Matt Levy')
        expect(page).to have_content('Age: 27')
        expect(page).to have_content('Job: Computer Programmer')
      end
    end

    it 'shows average age of all astronauts' do
      within "#average-age" do
        expect(page).to have_content('Average age: 32')
      end
    end

  end
end
