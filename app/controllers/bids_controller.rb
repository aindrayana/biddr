class BidsController < ApplicationController

  before_action :authenticate_user

  def create
    bid_params = params.require(:bid).permit(:amount)
    @auction = Auction.find params[:auction_id]
    if (@auction.bids.empty?)
      @current_price = 0
    else
      @current_price = @auction.bids.maximum(:amount)
    end
    @bid = current_user.bids.new(bid_params)
    @bid.auction = @auction

    # puts "CURRENT PRICE: #{@current_price}"

    # curr_bid = bid_params[:amount].to_f
    # @auction.bids.last ? max_bid = .to_f : max_bid = 0
    # puts "auction last bid : #{last_bid}"
    # puts "current bid: #{curr_bid}"
    # render text:bid_params

    if (@current_price < @bid.amount)
      if @bid.save
        redirect_to auction_path(@auction)
      else
        flash[:alert] = @bid.errors.full_messages.join(", ")
        # redirect_to auction_path(@auction)
        render "auctions/show"
      end
    else
      flash.now[:alert] = "Bidding amount should be higher that current price !!"
      # redirect_to auction_path(@auction)
      render "auctions/show"
      # render auction_path(@auction)
    end

  end
end
