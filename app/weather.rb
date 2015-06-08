module FC
  module Weather
    module_function

    API_KEY = 'YOUR_API_KEY' # https://developer.forecast.io

    def get(location, &block)
      @callback = block
      url = "https://api.forecast.io/forecast/#{API_KEY}/#{location}?units=auto&exclude=[minutely,daily]"
      AFMotion::JSON.get(url) do |response|
        if response.ok?
          json = response.object
          current = json["currently"]
          next_hour = json["hourly"]["data"][1]
          units = find_units(json["flags"]["units"])

          @callback.call(current, next_hour, units)
          FC::Mixpanel.event("weather_success")
        else
          puts "API Error: #{response.status_code}: #{response.status_description}"
          notification = NSUserNotification.alloc.init
          notification.title = "Error"
          notification.informativeText = "There was an error retrieving the lastest weather report."

          FC::Notification.send(notification)
          FC::Mixpanel.event("weather_failure")
        end
      end
    end

    def find_units(unit)
      case unit
      when "si" || "ca" || "uk"
        "c"
      when "us"
        "f"
      end
    end
  end
end
