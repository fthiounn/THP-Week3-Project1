#gems
require 'colorize'
require 'open-uri'
require 'ruby2d'
require 'time'

#files
load 'lib/user.rb'
load 'lib/event.rb'


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
test