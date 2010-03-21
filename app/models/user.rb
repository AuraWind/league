require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  has_many :events, :foreign_key => :created_by
  has_many :upcoming_events, :conditions => ['start_at > ?', Time.now], :class_name => 'Event', :foreign_key => :created_by
  has_many :signups
  has_many :user_games
  has_many :games, :through => :user_games, :order => 'name ASC'
  has_many :user_game_mains, :include => :game, :order => 'games.name ASC'
  
  has_one :user_profile
  has_one :user_role
  
  belongs_to :role
  
  before_create :set_role
  after_create :create_user_profile
  
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
  
  named_scope :on_xbox360, :include => :user_profile, :conditions => ["user_profiles.username_xbox360 <> ''"], :order => 'login ASC'
  named_scope :on_ps3, :include => :user_profile, :conditions => ["user_profiles.username_ps3 <> ''"], :order => 'login ASC'
    
  attr_accessible :login, :email, :first_name, :last_name, :password, :password_confirmation

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find :first, :conditions => ['LOWER(login) = ?', login.downcase]
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def name
	self.first_name + ' ' + self.last_name
  end
  
  def upcoming_signups
	#TODO: Find a better way to filter events.  Can't eager load polymorphic associations
	signups = self.signups.find(:all,
		:joins => 'INNER JOIN events ON signups.signupable_id = events.id',
		:conditions => ['start_at > ? AND signups.signupable_type = ?', Time.now, 'Event'],
		:order => 'start_at ASC')
  end
  
  def main(game)
	user_game_main = self.user_game_mains.find(:first, :conditions => ['game_id = ?', game.id])
	user_game_main.blank? ? '' : user_game_main.main
  end
  
  def signed_up?(event)
	self.signups.find(:first, :conditions => ['signupable_id = ? AND signupable_type = ?', event.id, event.class.name])
  end

  ################ private methods ###############
  private
  
  def create_user_profile
	UserProfile.create({:user_id => self.id})
  end
  
  def set_role
	return if self.role_id.present?
	self.role_id = Role.default.id
  end
  
  
  protected
    


end
