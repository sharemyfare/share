class Casualshare < ActiveRecord::Base

	belongs_to :user
	has_many :casualsubscriptions

end
