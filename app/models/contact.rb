require 'roo'
class Contact < ActiveRecord::Base
	def self.import(file)

		sheet = Roo::Spreadsheet.open(file)
		sheet.each(first_name: 'First Name', number: 'Phone #') do |hash|
		  	puts hash.inspect
		  	formatted_number = hash[:number]
		 	if formatted_number =~ /\d/ || formatted_number.is_a?(Float) || formatted_number.is_a?(Integer)
		 		if  formatted_number.is_a?(Float) || formatted_number.is_a?(Integer)
		 			formatted_number = formatted_number.to_s.chomp(".0") 			
		 		else
			  		formatted_number =  "#{hash[:number].gsub(/\D/, '')}"
				end
				if formatted_number.length == 11 && formatted_number[0] == "1" 
			  		formatted_number = "+#{formatted_number}"
				elsif  formatted_number.length == 10
					formatted_number = "+1#{formatted_number}"
				end
				contact = Contact.find_or_create_by(number: formatted_number)
			end
		end
	end
end
