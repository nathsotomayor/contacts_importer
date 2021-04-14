module ContactsHelper
  def custom_format_date(date)
    Date.iso8601(date).strftime('%Y %B %e')
  end
end
