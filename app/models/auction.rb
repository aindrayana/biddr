class Auction < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true

end
