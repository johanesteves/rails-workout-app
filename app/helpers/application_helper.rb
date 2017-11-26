module ApplicationHelper

  def full_date(date)
    if date.today?
      'Today'
    else
      date.strftime('%b %e, %y')
    end
  end
end
