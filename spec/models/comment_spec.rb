require 'rails_helper'

describe Comment do

  context "comments validation" do

    let(:product) { Product.create!(name: "Bike") }
    let(:user) { User.create!(email: "nadia.mohamed@gmail.com", password: "password1")}

    it "is valid with valid attributes" do
      expect(Comment.new(rating: 5, user: user, body: "Great!", product_id: 1, created_at: Time.now, updated_at: Time.now, product: product)).to be_valid
    end

    it "is not valid without a rating" do
      expect(Comment.new(user: user, body: "Great!")).to_not be_valid
    end

    it "is not valid without a user" do
      expect(Comment.new(rating: 5, body: "Great!")).to_not be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(rating: 5, user: user)).to_not be_valid
    end

  end

end
