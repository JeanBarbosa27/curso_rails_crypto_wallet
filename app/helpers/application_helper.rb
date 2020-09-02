module ApplicationHelper
  def format_date_br(us_date_format)
    us_date_format.strftime('%d/%m/%Y')
  end
end
