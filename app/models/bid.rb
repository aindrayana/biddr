class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  # validates :amount, presence: true, numericality: {greater_than: cur_price}
  # validate :bid_price_must_be_higher_than_the_current_price
  #
  # def bid_price_must_be_higher_than_the_current_price
  #   if auction.bids.maximum(:amount) > bid.amount
  #     errors.add(:amount, "must be greater than current price")
  #   end
  # end

end
