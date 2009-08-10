require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  has_many :signups
  has_many :user_games
  has_many :games, :through => :user_games, :order => 'name ASC'

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :first_name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message
  validates_length_of       :first_name,     :maximum => 50
  
  validates_format_of       :last_name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message
  validates_length_of       :last_name,     :maximum => 50

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :first_name, :last_name, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def name
	self.first_name + ' ' + self.last_name
  end
  
  def upcoming_events
	upcoming_event_ids = Event.upcoming_all.collect {|e| e.id}
	signups = Signup.find(:all, 
		:joins => 'INNER JOIN events ON events.id = signups.assembly_id', 
		:conditions => ['user_id = ? AND assembly_type = ? AND assembly_id IN (?)', self.id, 'Event',  upcoming_event_ids], 
		:order => 'events.start_at ASC')
  end

  protected
    


end
