module AuctionsHelper
  def label_class(state)
    case state
    when "published"
      "label-default"
    when "reserved"
      "label-primary"
    when "won"
      "label-success"
    when "canceled"
      "label-danger"
    when "not_reserved"
      "label-warning"
    end
  end

end
