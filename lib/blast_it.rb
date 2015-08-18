require 'twilio-ruby'

class BlastIt


	def initialize(args)
		@from = args[:from_number]
		@client = Twilio::REST::Client.new args[:account_sid], args[:auth_token]
	end

	def send_mass_text(message, contacts)

		contacts.each do |contact|
			personalized_message = personalize_message(message, contact)
		  @client.account.messages.create(
		    :from => @from,
		    :to =>contact[:number],
		    :body => personalized_message
		  )
		  puts "Sent message to #{contact[:number]}"
		end

		
	end

	protected
		def personalize_message(message, contact)
			message
		end


end

