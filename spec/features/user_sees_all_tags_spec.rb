require "rails_helper"
describe "user sees all articles" do
  describe "they visit /tags" do
    it "displays all tags" do
      tag_1 = Tag.create!(name:"name_1")
      tag_2 = Tag.create!(name:"name_2")

      visit '/tags'

      expect(page).to have_link(tag_1.name)
      expect(page).to have_link(tag_2.name)
    end
  end
end
