def add_message(message)
  fill_in "Message", with: message
  click_button "Submit"
end

def format_time_and_date(time)
  post_time = time.strftime("%H:%M:%S")
  post_date = time.strftime("%d %b %Y")
  return "#{post_time}, #{post_date}"
end
