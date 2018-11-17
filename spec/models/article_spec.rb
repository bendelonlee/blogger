require "rails_helper"

describe Article, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
    it {should have_many(:comments)}
    it {should have_many(:taggings)}
  end
  describe "instance methods" do
    it "turns associated tags into a string" do
      article = Article.create(title: "Mr. Peanutbutter", body: "Don't be allergic")
      article.tags.create(name: "allergies")
      article.tags.create(name: "peanuts")

      expect(article.tag_list).to eq("allergies, peanuts")
    end
  end
end
