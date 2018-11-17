require "rails_helper"

describe Tag, type: :model do
  describe "relationships" do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end
  describe "instance methods" do
    it "should have a to_s method that returns the name of the tag" do
      tag = Tag.create(name: "maytag")
      expect(tag.to_s).to eq("maytag")
    end
  end
end
