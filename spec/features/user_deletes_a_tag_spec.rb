require "rails_helper"
describe "user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles without the deleted entry" do
      tag_1 = Tag.create!(name:"name 1")
      tag_2 = Tag.create!(name:"name 2")

      visit tag_path(tag_1)
      click_link "Delete"

      expect(current_path).to eq(tags_path)
      expect(page).to have_content(tag_2.name)
      expect(page).to have_content("tag 'name 1' was deleted.")
      visit tags_path
      expect(page).to_not have_content(tag_1.name)

    end
  end
end
