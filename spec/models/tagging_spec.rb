require "rails_helper"

describe Tagging, type: :model do
  describe "relationships" do
    it {should belong_to(:article)}
    it {should belong_to(:tag)}
  end
end
