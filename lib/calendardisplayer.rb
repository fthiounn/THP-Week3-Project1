#SPECIFICATIONS class CalendarDisplayer
# we want to display the current month
#  1. get the current month
#  3. get the number of days in the month 
#  4. print line by line

# ¿WHY?

#THis class displays the event into an ascii calendar

class CalendarDisplayer
	COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	@chosen_month = Time.now.month
	@chosen_year = 2019
	def initialize
		display_loop
	end
	def display_loop
		user_entry = print_calendar(Time.now.month)
		while (user_entry >1 || user_entry <0) do
			puts "Enter 1 for last month, 2 for next month, 0 to exit"
			user_entry = gets.to_i
		end
		case user_entry
		when 0
			puts "Thank you for using calendar"
			return
		when 1
			@chosen_year-=1 if @chosen_month == 1
			@chosen_month-=1
			@chosen_month = 12 if @chosen_month == 0
			display_loop
			return
		when 2
			@chosen_year+=1 if @chosen_month == 12
			@chosen_month+=1
			@chosen_month = 1 if @chosen_month == 13
			display_loop
			return
		else
			puts "Error with the user entry"
		end


	end


	def print_calendar (year,month)
		#init
		system "clear"
		@day_counter = 1
		@nb_days = days_in_month(month , year)
		puts "#{chosen_month} #{chosen_year}"
		for n in 0..(@nb_days-1) do
			if (n%6 == 0) then #lignes 0-6-12-18-24-30
				line_1
			elsif ((n-1) % 6 == 0) then #lignes 1-7-13-19-25
				line_2
			elsif ((n-2) % 6 == 0) then #lignes 2-8-14-20-26
			 	line_3(year,month)
			elsif ((n-3) % 6 == 0) then #lignes 3-9-15-21-27
				line_4(year,month)
			elsif ((n-4) % 6 == 0) then #lignes 4-10-16-22-28
				line_5(year,month)
			elsif ((n-5) % 6 == 0) then #lignes 5-11-17-23-29
				line_6(year,month)
				@day_counter+=7
			end
		end
		puts "Enter 1 for next month, 0 for last month"
		return gets.to_i
	end
	private
	#lignes 0-6-12-18-24-30
	def line_1
		puts "-----------------------------------------------------------------------"
		#print du separateur de ligne
	end
	#lignes 1-7-13-19-25
	def line_2
		#print des jours
		day_counter_loop = @day_counter	
		7.times do
			if day_counter_loop <= @nb_days 
				if day_counter_loop <10 
					print "|#{day_counter_loop}        "
				else
					print "|#{day_counter_loop}       "
				end
			day_counter_loop += 1
			end
		end
		puts "|"
	end
	#lignes 2-8-14-20-26
	def line_3(year,month)
		day_counter_loop = @day_counter	
		7.times do
			if day_counter_loop <= @nb_days 
				table_event = Event.get_daily_events(Time.new(year, 10, day_counter_loop))
				if(table_event.size == 0) then
					print "|         "
				elsif table_event.size == 1
					print "|#{table_event[0].start_date.strftime('%H:%M')}    "
				else
					print "|         "
				end
				#check how many event on that day
				#if 0 print space
				#if 1 print hour
			day_counter_loop += 1
			end
		end
		puts "|"
	end
	#lignes 3-9-15-21-27
	def line_4(year,month)
		day_counter_loop = @day_counter	
		7.times do
			if day_counter_loop <= @nb_days 
				table_event = Event.get_daily_events(Time.new(year, 10, day_counter_loop))
				if(table_event.size == 0) then
					print "|         "
				elsif table_event.size == 1 && !table_event[0].title.split(" ").at(0).nil?
					if (!table_event[0].title.split(" ").at(0).nil?)then
						tmp = 9 - table_event[0].title.split(" ").at(0).size
						(tmp < 0) ? tmp = 0 : ""
						str = " "*tmp
						print "|#{table_event[0].title.split(" ").at(0)}"+ str
					end
				else
					print "|         "
				end
				#check how many event on that day
				#if 0 print space
				#if 1 print first word if title
			day_counter_loop += 1
			end
		end
		puts "|"
	end
	#lignes 4-10-16-22-28
	def line_5(year,month)
		day_counter_loop = @day_counter	
		7.times do
			if day_counter_loop <= @nb_days 
				table_event = Event.get_daily_events(Time.new(year, 10, day_counter_loop))
				if(table_event.size == 0) then
					print "|         "
				elsif table_event.size == 1 && !table_event[0].title.split(" ").at(1).nil?
					if (!table_event[0].title.split(" ").at(1).nil?)then
						tmp = 9 - table_event[0].title.split(" ").at(1).size
						(tmp < 0) ? tmp = 0 : ""
						str = " "*tmp
						print "|#{table_event[0].title.split(" ").at(1)}"+ str
					end
				else
					print "|         "
				end
				#check how many event on that day
				#if 0 print space
				#if 1 print second word if title
			day_counter_loop += 1
			end
		end
		puts "|"
	end
	#lignes 5-11-17-23-29
	def line_6(year,month)
		day_counter_loop = @day_counter	
		7.times do
			if day_counter_loop <= @nb_days 
				table_event = Event.get_daily_events(Time.new(year, 10, day_counter_loop))
				if(table_event.size == 0) then
					print "|         "
				elsif table_event.size == 1 && !table_event[0].title.split(" ").at(2).nil?
					if (!table_event[0].title.split(" ").at(2).nil?)then
						tmp = 9 - table_event[0].title.split(" ").at(2).size
						(tmp < 0) ? tmp = 0 : ""
						str = " "*tmp
						print "|#{table_event[0].title.split(" ").at(2)}"+ str
					end
				else
					print "|         "
				end
			day_counter_loop += 1
			end
		end
		puts "|"
	end

	# This function returns the number of days in a given month
	def days_in_month(month, year = Time.now.year)
	   return 29 if month == 2 && Date.gregorian_leap?(year)
	   return COMMON_YEAR_DAYS_IN_MONTH[month]
	end

end



















