require 'rails_helper'

feature "user can delete characters", %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
} do

  scenario "user deletes a character" do
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
      actor_id: actor.id,
      description: 'Lord of the North.',
      television_show_id: show.id
      )

    visit "/television_shows/#{show.id}"
    click_on 'Delete Character'

    expect(page).to have_content "Character deleted."
    expect(page).not_to have_content char.character_name
  end
end
