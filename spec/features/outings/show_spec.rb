require "rails_helper"

RSpec.describe "Outing show page", type: :feature do
  it "shows the outing name, location, date, contestants names and a count of them" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
    contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")
    outing1 = Outing.create!(name: "Bachelorette Party", location: "Weasel's Cove", date:"9/13/2002", contestants: [contestant1, contestant2, contestant3])

    visit outing_path(outing1)

    expect(current_path).to eq("/outings/#{outing1.id}")

    expect(page).to have_content("Bachelorette Party")
    expect(page).to have_content("Weasel's Cove")
    expect(page).to have_content("9/13/2002")
    expect(page).to have_content("Contestants Count: 3")
    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(contestant2.name)
    expect(page).to have_content(contestant3.name)
  end

  it "has a link to remove a contestant from an outing, and only that outing" do
    bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
    contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
    contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
    contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")
    outing1 = Outing.create!(name: "Bachelorette Party", location: "Weasel's Cove", date:"9/13/2002", contestants: [contestant1, contestant2, contestant3])
    outing2 = Outing.create!(name: "Crawl the Pubs", location: "Lake Tacet City", date:"9/14/2002", contestants: [contestant1, contestant2, contestant3])

    visit outing_path(outing1)

    expect(current_path).to eq("/outings/#{outing1.id}")
    expect(page).to have_content("Bachelorette Party")
    expect(page).to have_content(contestant1.name)
    expect(page).to have_link("Remove #{contestant1.name} from Bachelorette Party")

    click_link("Remove #{contestant1.name} from Bachelorette Party")

    expect(current_path).to eq("/outings/#{outing1.id}")
    expect(page).to have_content("Bachelorette Party")
    expect(page).not_to have_content(contestant1.name)

    visit outing_path(outing2)

    expect(current_path).to eq("/outings/#{outing2.id}")
    expect(page).to have_content("Crawl the Pubs")
    expect(page).to have_content(contestant1.name)
  end
end
