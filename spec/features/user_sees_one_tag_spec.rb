require "rails_helper"
describe "user sees one tag" do
  describe "they link from the article page" do
    it "should link to the tag and all its articles" do
      article_1 = Article.create!(title: "New Title", body: "New Body")
      tag = article_1.tags.create!(name: "name")
      article_2 = Article.create!(title: "Newer Title", body: "Newer Body")
      article_2.tags << tag

      visit article_path(article_1)
      click_link("name")

      expect(page).to have_content("name")
      expect(page).to have_content("New Title")
      expect(page).to have_content("Newer Title")
    end
  end
end
