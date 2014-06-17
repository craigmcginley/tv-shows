require 'rails_helper'

feature "user can add actors", %Q{
  As a site visitor
  I want to add my favorite actors
  So that users can attribute their roles properly
} do

  scenario "user adds a new actor" do
    actor = Actor.new(
      name: 'Sean Bean'
      )

    visit "/actors/new"
    fill_in 'Name', with: actor.name
    click_on 'Create Actor'

    expect(page).to have_content 'Success'
    expect(Actor.count).to eq(1)
    expect(page).to have_content actor.name
  end

  scenario "actor name can't be blank" do
    visit "/actors/new"
    click_on 'Create Actor'

    expect(page).to have_content "Name can't be blank"
    expect(page).not_to have_content "Success"
  end

  scenario "can't submit actor who already exists" do
    actor = Actor.create(
      name: 'Sean Bean'
      )

    visit "/actors/new"
    fill_in 'Name', with: actor.name
    click_on 'Create Actor'

    expect(page).to have_content "Name has already been taken"
    expect(page).not_to have_content "Success"
  end

end
