require "rails_helper"

RSpec.describe "contestant show page", type: :feature do
  it "shows the name, season, description, and outings of a contestant" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    outing1 = contestant1.outings.create!(name: "Bungie", location: "Niagra Falls")
    outing2 = contestant1.outings.create!(name: "Pub Crawling", location: "Baltimore ")
    outing3 = contestant1.outings.create!(name: "Road Trip", location: "East Coast")

    visit "/bachelorettes/#{bachelorette1.id}/contestants/#{contestant1.id}"

    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(bachelorette1.season_number)
    expect(page).to have_content(bachelorette1.description)
    expect(page).to have_link(outing1.name)
    expect(page).to have_link(outing2.name)
    expect(page).to have_link(outing3.name)

    click_link(outing1.name)

    expect(current_path).to eq("/outings/#{outing1.id}")
  end
end
