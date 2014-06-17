require 'rails_helper'

feature "user can views a list of characters from all shows", %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do
  scenario "see a list of all characters with associated tv shows" do
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

    visit "/characters"
    expect(page).to have_content "All Characters"
    expect(page).to have_content char.character_name
    expect(page).to have_content show.title
  end
end
