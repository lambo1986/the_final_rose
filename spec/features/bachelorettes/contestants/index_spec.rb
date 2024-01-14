require "rails_helper"

RSpec.describe "bachelorette's contestants index page", type: :feature do
  it "shows the bachelorette's contestants attributes, and name is a link to their show page" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
    contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")

    visit("/bachelorettes/#{bachelorette1.id}/contestants")

    expect(page).to have_link(contestant1.name)
    expect(page).to have_content(contestant1.age)
    expect(page).to have_content(contestant1.hometown)
    expect(page).to have_link(contestant2.name)
    expect(page).to have_content(contestant2.age)
    expect(page).to have_content(contestant2.hometown)
    expect(page).to have_link(contestant3.name)
    expect(page).to have_content(contestant3.age)
    expect(page).to have_content(contestant3.hometown)

    click_link("Ash")

    expect(current_path).to eq("/bachelorettes/#{bachelorette1.id}/contestants/#{contestant1.id}")
  end
end
