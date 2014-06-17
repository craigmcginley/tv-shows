require 'rails_helper'

feature "displays actors info" do
  scenario "user views an actors details" do
    actor = Actor.create(
      name: 'Sean Bean'
      )
    show = TelevisionShow.create(
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
      )
    char = Character.create(
      character_name: 'Eddard Stark',
      actor_id: actor.id,
      television_show_id: show.id,
      description: 'Lord of the North.'
      )

    visit "/actors/#{actor.id}"
    expect(page).to have_content actor.name
    expect(page).to have_content char.character_name
    expect(page).to have_content show.title
  end
end
