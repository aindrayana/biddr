class ReservingsController < ApplicationController

  before_action :authenticate_user

  def create
    auction = Auction.find params[:auction_id]
    if auction.reserve
      auction.save
      redirect_to auction, notice: "Auction Published!"
    else
      redirect_to auction, alert: "Error! Can't publish auction"
    end
  end

end
