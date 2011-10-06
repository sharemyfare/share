class Regularshare < ActiveRecord::Base

	belongs_to :user
	has_many :regularsubscriptions, :dependent => :destroy
	has_many :regularcomments, :dependent => :destroy


end
