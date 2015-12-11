require 'rails_helper'

RSpec.describe Auction, type: :model do

  describe "validations" do
    it "require a title" do
      auction = Action.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:title)
    end
  end


end
