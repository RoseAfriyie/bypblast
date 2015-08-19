class Event < ActiveRecord::Base
	has_many :blasts, as: :ownable
	has_many :responses, through: :blasts
end
