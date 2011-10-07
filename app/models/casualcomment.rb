class Casualcomment < ActiveRecord::Base

	belongs_to :casualshare
	belongs_to :user

end
