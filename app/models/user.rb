class User < ActiveRecord::Base
    acts_as_authentic

   #associations-------------------
	belongs_to :city
	has_many :casualshares, :dependent => :destroy
	has_many :regularshares, :dependent => :destroy
	has_many :casualsubscriptions, :dependent => :destroy
	has_many :regularsubscriptions, :dependent => :destroy
	has_many :casualcomments, :dependent => :destroy					
	has_many :regularcomments, :dependent => :destroy				




   #-------------------------------
   #VALIDATIONS--------------------
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :username,  :presence => true, :length => { :in => 3..20 }
    validates :lastname,  :presence => true
    validates :firstname,  :presence => true
    validates :email, :presence => true,
                     :format => { :with => email_regex },
                     :uniqueness => { :case_sensitive => false }
    validates :city, :presence => true
    
    validates :password, :presence => true,
                         :confirmation => true,
                         :length => { :within => 2..40 }

    
    #before_save :encrypt_password
    
    validates :sex,  :presence => true
    validates :dateofbirth,  :presence => true
    validates :phonenumber,  :presence => true, :numericality => true
    


   #-------------------------------
   def deliver_password_reset_instructions!
     reset_perishable_token!
     Notifier.deliver_password_reset_instructions(self)
   end
end
