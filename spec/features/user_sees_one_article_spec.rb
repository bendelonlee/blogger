require "rails_helper"
describe "user sees one article" do
  describe "they link from the article index" do
    it "displays information for one article" do
      article = Article.create!(title: "New", body: "How much")
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comment")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")

      visit '/articles'

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)

      click_link "<< Back to Articles"

      expect(current_path).to eq(articles_path)
    end
  end
end
