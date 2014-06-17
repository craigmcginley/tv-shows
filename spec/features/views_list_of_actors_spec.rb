require 'rails_helper'

feature 'user views a list of actors' do
  scenario 'index shows list of actors' do
    actors = []
    actor_attrs = [
      { name: 'Sean Bean' },
      { name: 'Peter Dinklage' }
    ]

    actor_attrs.each do |attrs|
      actors << Actor.create(attrs)
    end

    visit '/actors'
    actors.each do |actor|
      expect(page).to have_content actor.name
    end
  end
end
