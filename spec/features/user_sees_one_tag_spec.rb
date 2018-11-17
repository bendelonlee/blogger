require "rails_helper"
describe "user sees one tag" do
  describe "they link from the article page" do
    it "should link to the tag and all its articles" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag = article.tags.create!(name: "Name")
      article = Article.create!(title: "Newer Title", body: "Newer Body")
      tag = article.tags.create!(name: "Name")

      visit article_path(article)
      click_link("Name")

      expect(page).to have_content("Name")
      # expect(page).to have_content("New Title")
      expect(page).to have_content("Newer Title")
    end
  end
end
