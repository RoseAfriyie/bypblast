class Event < ActiveRecord::Base
	has_many :blasts
	has_many :responses, through: :blasts
end
