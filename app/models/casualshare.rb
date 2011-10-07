class Casualshare < ActiveRecord::Base

	belongs_to :user
	has_many :casualsubscriptions, :dependent => :destroy
	has_many :casualcomments, :dependent => :destroy
end
