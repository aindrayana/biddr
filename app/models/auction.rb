class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true
  validates :end_date, presence: true

  include AASM

  aasm whiny_transitions: false do
    state :published, initial: true
    state :reserved
    state :won
    state :canceled
    state :not_reserved

    event :reserve do
      transitions from: :published, to: :reserved
    end
    #
    # event :win do
    #   transitions from: :reserved, to: :won
    # end
    #
    # event :cancel do
    #   transitions from: [:published, :reserved], to: :canceled
    # end
    #
    # event :not_reserve do
    #   transitions from: :published, to: :not_reserved
    # end

  end



end
