require "rails_helper"

describe Comment, type: :model do
  describe "validations" do
    it {should belong_to(:title)}
  end
end
