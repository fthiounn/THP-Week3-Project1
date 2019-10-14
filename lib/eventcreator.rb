#SPECIFICATION class EventCreator


# ¿WHY?

# Interface UI pour creer un evenement


class EventCreator
	attr_reader :start_date, :duration, :title, :attendees
	#on recupere les infos
	def initialize
		puts "Lets create en event"
		puts "First, whats the event name"
		print "> "
		@title = gets.chomp
		puts "Great, now when is it (time format)?"
		print "> "
		@start_date = gets.chomp
		puts "Perfect, how long is this event (in min)?"
		print "> "
		@duration = gets.chomp
		puts "Exellent, lets finish with the attendees emails"
		print "> "
		tble = gets.chomp
		@attendees = tble.split("; ")

		puts "The event has been created !"
		puts Event.new(@start_date,@duration,@title,@attendees).to_s
	end

end