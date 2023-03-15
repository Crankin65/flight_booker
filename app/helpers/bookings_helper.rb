module BookingsHelper
  def formatted_date(date)
    date.strftime("on %m/%d/%Y at %I:%M%p")
  end
end
