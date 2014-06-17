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
    actor = Actor.create(
      name: 'Sean Bean'
      )
    char = Character.new(
      character_name: 'Eddard Stark',
      description: 'Lord of the North.'
      )

    visit "/television_shows/#{show.id}"
    fill_in 'Character name', with: char.character_name
    select actor.name, from: 'character_actor_id'
    fill_in 'Description', with: char.description
    click_on 'Create Character'

    expect(page).to have_content 'Success'
    expect(Character.count).to eq(1)
    expect(page).to have_content show.title
    expect(page).to have_content char.character_name
    expect(page).to have_content actor.name
    expect(page).to have_content char.description
  end

  scenario "form fields can't be blank" do
    show = TelevisionShow.create(
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
      )

    visit "/television_shows/#{show.id}"
    click_on 'Create Character'

    expect(page).to have_content "Unable to save your character"
    expect(page).to have_content "Character name can't be blank"
    expect(page).to have_content "Actor can't be blank"
    expect(page).to_not have_content "Success"
  end

  scenario "can't submit character who already exists" do
    show = TelevisionShow.create(
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
      )
    actor = Actor.create(
      name: 'Sean Bean'
      )
    char = Character.create(
      character_name: 'Eddard Stark',
      description: 'Lord of the North.',
      actor_id: actor.id,
      television_show_id: show.id
      )

    visit "/television_shows/#{show.id}"
    fill_in 'Character name', with: char.character_name
    select actor.name, from: 'character_actor_id'
    fill_in 'Description', with: char.description
    click_on 'Create Character'

    expect(page).to have_content "Unable to save your character"
    expect(page).to have_content "Character name has already been taken"
  end

end
