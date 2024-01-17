require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  describe "instance methods" do
    it "has an #average_contestant_age method" do
      bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
      contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
      contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
      contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")
      contestant4 = bachelorette1.contestants.create!(name: "Jane", age: 45, hometown: "New York")
      contestant5 = bachelorette1.contestants.create!(name: "John", age: 32, hometown: "New York")

      expect(bachelorette1.average_contestant_age).to eq(27.2)
    end

    it "has a #contestants_hometowns method" do
      bachelorette1 = Bachelorette.create!(name: "Jenny Durham", season_number: 1, description: "Party Like It's 2002")
      contestant1 = bachelorette1.contestants.create!(name: "Ash", age: 20, hometown: "London")
      contestant2 = bachelorette1.contestants.create!(name: "Rachael", age: 20, hometown: "New York")
      contestant3 = bachelorette1.contestants.create!(name: "Stacy", age: 19, hometown: "Boston")
      contestant4 = bachelorette1.contestants.create!(name: "Jane", age: 45, hometown: "New York")
      contestant5 = bachelorette1.contestants.create!(name: "John", age: 32, hometown: "New York")

      expect(bachelorette1.contestants_hometowns).to include("London", "New York", "Boston")
      expect(bachelorette1.contestants_hometowns.count).to eq(3)
    end
  end
end
