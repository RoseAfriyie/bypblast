require 'twilio-ruby'
class MessagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		#Locate recipient
		params[:To][0] = ""
		to_number = params[:To]
		@recipient_number = Number.find_or_create_by(number: to_number)

		#Locate sender
		params[:From][0] = ""
		from_number = params[:From]
		@sender_number = Number.find_or_create_by(number: from_number)

		if Conversation.between(@sender_number.id, @recipient_number.id).present?
			#Fetch convo then make message based on reply body
	    @conversation = Conversation.between(@sender_number.id, @recipient_number.id).first
	  else
	    #Create convo then make message based on reply body
	    @conversation = Conversation.create!(sender_id: @sender_number.id, recipient_id: @recipient_number.id)
		end
		#Record reply in conversation
		@conversation.messages.create(number_id: @sender_number.id, body: params[:Body], conversation_id: @conversation.id)

		#Create dynamic reply based on reply
		message = "Thanks for letting us know."
		if params[:Body] == "Yes" || params[:Body] == "yes"
			#Response.create(number_id: @sender_number.id, value: "yes")
		elsif params[:Body] == "No"  || params[:Body] == "no"
			#Response.create(number_id: @sender_number.id, value: "no")
		else
			message = "Please reply with 'yes' or 'no'."
		end
		@conversation.messages.create(number_id: @recipient_number.id, body: message, conversation_id: @conversation.id)
		twiml = Twilio::TwiML::Response.new do |r|
		  r.Message message
		end
		render xml: twiml.text
	end
end
