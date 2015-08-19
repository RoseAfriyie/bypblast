class Number < ActiveRecord::Base
	belongs_to :ownable, polymorphic: true
	has_many :messages
	has_many :responses
end
