require 'atech_identity/user'

class User < ActiveRecord::Base
  
  include AtechIdentity::User::LocalUser
  
  attr_accessible :first_name, :last_name, :email_address
  
  has_many :tasks, :dependent => :destroy
  has_many :completed_tasks, :class_name => "Task", :foreign_key => "completed_by"
  has_many :reported_tasks, :class_name => "Task", :foreign_key => "reported_by"
  
  def self.find_or_create_by_atech_identity(id)
    if user = User.find_by_atech_identity_key(id.identifier)
      user
    else
      user = User.new
      user.first_name = id.first_name
      user.last_name = id.last_name
      user.email_address = id.email_address
      user.username = id.username
      user.atech_identity_key = id.identifier
      user.save
      user
    end
  end
  
  def short_name
    "#{first_name} #{last_name[0,1]}"
  end
  
end
