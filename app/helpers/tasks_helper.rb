module TasksHelper

  def format_date_time(datetime)
    if datetime.to_date == Date.today
      datetime.strftime('TODAY')
    elsif datetime.to_date == Date.tomorrow
      datetime.strftime('TOMORROW')
    else
      l datetime, format: '%A' + datetime.strftime(' %d.%m.%Y')
    end
  end

end
