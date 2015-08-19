class Event < ActiveRecord::Base
	has_many :blasts, as: :ownable
	has_many :events, through: :blasts
end
