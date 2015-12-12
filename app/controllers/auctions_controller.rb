class AuctionsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :find_auction, only: [:edit, :update, :destroy, :show]

  def index
    @auctions = Auction.all
  end

  def show
    @bid = Bid.new
    @current_price= @auction.bids.maximum(:amount)
  end

  def new
    @auction = Auction.new
  end

  def create
    # @auction.end_date = Date.parse(params(:end_date)).strftime("%Y-%m-%d")
    # puts "date-params: #{params[:end_date]}"
    @auction = Auction.new auction_params
    @auction.user = current_user
    # puts @auction.inspect
    # render text: auction_params

    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end



  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :detail, :end_date, :price)
  end

end
