class Blast < ActiveRecord::Base
	belongs_to :event
	has_many :responses
end
