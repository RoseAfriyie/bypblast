class Blast < ActiveRecord::Base
	belongs_to :ownable, polymorphic: true
	has_many :responses
end
