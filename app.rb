#gems
require 'time'

#files
load 'lib/user.rb'
load 'lib/event.rb'
load 'lib/eventcreator.rb'
load 'lib/calendar.rb'
load 'lib/calendardisplayer.rb'


#developpement tests
def test

	#tests on event
	event = Event.new("2019-01-13 09:00", 10, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
	event.to_s

	#tests on user
	User.new("julie@julie.com", 35)
	User.new("jean@jean.com", 23)
	User.new("claude@claude.com", 75)
	user_1 = User.find_by_email("claude@claude.com")
	puts "Voici l'age du User trouvé : #{user_1.age}"

end

#lancement de l'ui
def perform
	
	my_calendar = Calendar.new
	#filling the calendar with some bullshit
	Event.new("2019-10-01 10:00", 10, "standup quotidien", ["truc@mac1hin.com", "bidule3@chose.fr"])
	Event.new("2019-10-31 09:00", 20, "halloween", ["tru3c@machin.com", "bidule@chos4e.fr"])
	Event.new("2019-10-04 17:00", 40, "test", ["tru4c@machin.com", "bidule@cho4se.fr"])
	Event.new("2019-10-13 09:00", 50, "office party !", ["truc2@machin.com", "bidule@chose.fr"])
	Event.new("2019-10-26 09:00", 10, "un autre test", ["truc4@machin.com", "bidule@gchose.fr"])
	Event.new("2019-10-17 22:00", 20, "Birthday Francois", ["truc55@machin.com", "bidule@chose.fr"])
	Event.new("2019-10-13 08:00", 20, "THP rendu de projet", ["truc66@machin.com", "bidbule@chose.fr"])
	Event.new("2019-10-13 05:00", 130, "standup quotidien", ["truc7@machin.com", "bidule@chose.fr"])


	my_calendar.exec
end
perform