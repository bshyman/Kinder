module GoogleCalendarHelpers

  def send_cal_event(playdate, user)
   @event = {
    'summary' => playdate.title,
    'description' =>  playdate.description,
    'location' =>  playdate.location,
    'start' => {'dateTime' => parse_date_time(playdate).to_s},
    'end' => {'dateTime' => (parse_date_time(playdate) + 1.hours).to_s}
    }

    client = Google::APIClient.new
    client.authorization.access_token = current_user.token
    service = client.discovered_api('calendar', 'v3')
    @set_event = client.execute(:api_method => service.events.insert,
      :parameters => {'calendarId' => user.email, 'sendNotifications' => true},
      :body => JSON.dump(@event),
      :headers => {'Content-Type' => 'application/json'})
  end


  def parse_date_time(playdate)
    d = playdate.date
    t = playdate.time
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
  end
end
