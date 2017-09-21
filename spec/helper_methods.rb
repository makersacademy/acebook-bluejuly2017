def add_message(message)
  fill_in "Message", with: message
  click_button "Submit"
end

def format_time_and_date(time)
  time.strftime("%H:%M:%S, %d %b %Y")
end

def delete_message(message)
  click_link "Delete"
end
