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

  it "shows the bachelorette's contestants' hometowns, unique" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
    contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")
    contestant4 = bachelorette1.contestants.create!(name: "Jane", age: 45, hometown: "New York")
    contestant5 = bachelorette1.contestants.create!(name: "John", age: 32, hometown: "New York")

    visit("/bachelorettes/#{bachelorette1.id}/contestants")

    within("#hometowns") do
      expect(page).to have_content("Contestant Hometowns")
      expect(page).to have_content(contestant1.hometown)
      expect(page).to have_content(contestant2.hometown)
      expect(page).to have_content(contestant3.hometown)
      expect(page).to have_content(contestant4.hometown)
      expect(page).to have_content(contestant5.hometown)
    end
  end
end
