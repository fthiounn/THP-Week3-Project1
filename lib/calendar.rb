#SPECIFICATION class EventCreator


#


class Calendar

	#constructor
	def initialize
		
	end
	#lancement de l'UI, boucle sur le menu
	def exec
		system 'clear'
		display_menu
		case get_user_menu_input
		when 1#Add an event
			EventCreator.new
			self.exec
			return
		when 2#Display the Calendar
			CalendarDisplayer.new
			self.exec
			return
		when 0
			puts "Thanks for using Calendar !"
			return
		else
			puts "Error with the menu input"
		end

	end


	private
	#Display the calencdar Menu
	def display_menu
		puts "Welcome To the Calendar"
		puts "Please enter your Menu choice"
		puts "1. Add an event"
		puts "2. Display the Calendar"
		puts "0. Quit"
		puts "> "
	end
	#Gets and check the user input for the menu
	def get_user_menu_input
		input = gets.to_i
		while (input < 0  || input > 2) do
			puts "Please enter a valid input"
			print " >"
			input = gets.to_i
		end
		return input
	end

end