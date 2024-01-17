require "rails_helper"

RSpec.describe "Bachelorette show page", type: :feature do
  it "shows name, season number, description of season, and a link to see only her contestants" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
    contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")

    visit "/bachelorettes/#{bachelorette1.id}"

    expect(page).to have_content(bachelorette1.name)
    expect(page).to have_content(bachelorette1.season_number)
    expect(page).to have_content(bachelorette1.description)
    expect(page).to have_link("Jenny Durham's Contestants")

    click_link("Jenny Durham's Contestants")

    expect(current_path).to eq("/bachelorettes/#{bachelorette1.id}/contestants")

    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(contestant2.name)
    expect(page).to have_content(contestant3.name)
  end

  it "shows the average age of contestants for that bachelorette" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
    contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")
    contestant4 = bachelorette1.contestants.create!(name: "Jane", age: 45, hometown: "New York")
    contestant5 = bachelorette1.contestants.create!(name: "John", age: 32, hometown: "New York")

    expect(bachelorette1.average_contestant_age).to eq(27.2)

    visit "/bachelorettes/#{bachelorette1.id}"

    expect(page).to have_content(bachelorette1.average_contestant_age)
  end
end
