require "rails_helper"
describe "user edits an article" do
  describe "they link from the show page" do
    it "diplays the article with the changes made" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      visit article_path(article_1)
      click_link "Edit"

      #what sort of path should this expect?
      fill_in "article[title]", with: "New Title!"
      click_on "Save"

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content("New Title!")
      expect(page).to_not have_content("Title 1")
    end
  end
end
