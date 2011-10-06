class UserSession < Authlogic::Session::Base 


   
	#validates :username, :presence => true
	#validates :password, :presence => true
  def to_key
     new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
  
  def persisted?
    false
  end

  private
     def check_if_awesome
       errors.add(:login, "must contain awesome") if login && !login.include?("awesome")
       errors.add(:base, "You must be awesome to log in") unless attempted_record.awesome?
     end
end

