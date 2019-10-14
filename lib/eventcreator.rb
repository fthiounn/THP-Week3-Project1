#SPECIFICATION class EventCreator


# ¿WHY?

# Interface UI pour creer un evenement


class EventCreator
	#on recupere les infos
	def initialize
		puts "Lets create en event"
		puts "First, what's the event name"
		print "> "
		title = gets.chomp
		puts "Great, now when is it? (follow this format: october 14 2019 at 15:00)"
		print "> "
		start_date = gets.chomp
		while(date_parser(start_date) == nil) do
			puts "Please follow the time format : month day year at hour:min"
			start_date = gets.chomp
		end
		puts "Perfect, how long is this event (in min)?"
		print "> "
		duration = gets.chomp
		puts "Exellent, lets finish with the attendees emails"
		print "> "
		tble = gets.chomp
		attendees = tble.split("; ")

		puts "The event has been created !"
		puts Event.new(start_date,duration,title,attendees).to_s
	end
	#This function takes a string containing a date and returns another string ready to be parsed 
	#into a time object
	def date_parser (str)
		parsing = str.split(" ")
		month = parsing[0]
		day = parsing[1]
		year = parsing[2]
		hour = parsing[4]
		#checking up the value, we exit with nil if format doescnt match
		#hours: we want the following => size between 3 and 5 and the symbol ":" at the right spot
		if hour.size < 3 || hour.size > 5 then
			return nil
		elsif hour.size == 3 then
			if hour[1] != ":" then
				return nil
			end
		elsif hour.size == 4 then
			if (hour[1] != ":") && hour[2] != ":" then
				return nil
			end
		elsif hour.size == 5 then
			if hour[2] != ":" then
				return nil
			end
		end
		#year: we just want to check the size (4)
		if year.size != 4
			return nil
		end
		#day: just a range check
		if day.to_i > 31 || day.to_i < 1
			return nil
		end
		#month
		month.capitalize!
		month = Date::MONTHNAMES.index(month) 
		puts month
		if month > 12 || month < 1
			return nil
		end
				
				


		parsed_string = year + "-"+month.to_s+"-"+day+" "+hour+":00 +0100"
		#2010-10-31 09:00:00 +0100

		return parsed_string
	end
end