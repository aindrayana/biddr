require 'rails_helper'

RSpec.describe Auction, type: :model do

  describe "validations" do
    # rspec spec/models/auction_spec.rb:7
    it "require a title" do
      auction = Auction.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:title)
    end

    # rspec spec/models/auction_spec.rb:14
    it "require a reserve price" do
      auction = Auction.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:price)
    end
  end


end
