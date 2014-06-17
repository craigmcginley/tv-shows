require 'rails_helper'

feature "user can add characters for shows", %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

  scenario "user adds a new character" do
    #save_and_open_page
    #tail -f log/test.log
    show = TelevisionShow.create(
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
      )
    char = Character.new(
      character_name: 'Eddard Stark',
      actor_name: 'Sean Bean',
      description: 'Lord of the North.'
      )

    visit "/television_shows/#{show.id}"
    fill_in 'Character name', with: char.character_name
    fill_in 'Actor name', with: char.actor_name
    fill_in 'Description', with: char.description
    click_on 'Create Character'

    expect(page).to have_content 'Success'
    expect(Character.count).to eq(1)
    expect(page).to have_content show.title
    expect(page).to have_content char.character_name
    expect(page).to have_content char.actor_name
    expect(page).to have_content char.description
  end

end
