# SPECIFICATIONS Class Event

# Un événement est défini par une date de début, une durée, un titre, un ou plusieurs utilisateurs.
# Il faut être capable de décaler un événement au lendemain, même heure.
# Il faut qu'il soit possible de récupérer des informations comme :
# La date de fin ;
# Savoir si un événement est passé ou non ;
# Savoir si un événement est dans moins de 30 minutes (au cas où nous voudrions envoyer un rappel).
# Il faut que l'on soit capables d'afficher de manière présentable un événement


# ¿WHY?

# this class handles the Events of our calendar, each instance is a User

class Event

	attr_accessor :start_date, :duration, :title, :attendees

	#constructor
	def initialize(start_date,duration,title,attendees)
		@attendees = []
		@start_date = Time.parse(start_date)
		@duration = duration.to_i
		@title = title
		@attendees = attendees
	end
	#decale l'evenement de 24h
	def postpone_24h
		@start_date += 24 * 60 * 60
	end
	#process and return the end_date
	def end_date
		return @start_date + (@duration * 60)
	end
	#Boolean awnser to the question is the event aleady started
	def is_past?
		return @start_date < Time.now
	end
	#Boolean awnser to the question is the event not started yet
	def is_future?
		return !is_past
	end
	#Boolean awnser to the question is the event in less than 30 min
	def is_soon?
		return (is_past?) && (@start_date > (Time.now - 30*60))
	end
	#display on terminal the event
	def to_s
		puts "Event Name : #{@title}"
		puts "Start date : #{@start_date}     End Date : #{end_date}"
		puts "Duration   : #{@duration} minutes"
		print "Attendees : "
		for a in 0..@attendees.size do
			print @attendees[a]
			print "  "
		end
		puts
	end
end





