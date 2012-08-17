class Task < ActiveRecord::Base
  
  attr_accessible :text, :user_id, :due_on, :project_id
  
  belongs_to :user
  belongs_to :project
  belongs_to :completion_user, :class_name => "User", :foreign_key => "completed_by"
  belongs_to :reporting_user, :class_name => "User", :foreign_key => "reported_by"
  
  validates :text, :presence => true
  
  default_scope order("due_on IS NULL, due_on, created_at asc")
  scope :active, where(:completed_at => nil)
  scope :completed, where("completed_at is not null")
  scope :unassigned, where(:user_id => nil)
  scope :today, lambda { where(["due_on >= ? OR due_on <= ?", Time.now.beginning_of_day, Time.now.end_of_day]) }
  
  before_save :parse_text
  
  def mark_as_completed_by(user)
    if self.completed?
      self.completed_by = nil
      self.completed_at = nil
    else
      self.completed_by = user
      self.completed_at = Time.now
    end
    self.save
  end
  
  def completed?
    !self.completed_at.blank?
  end
  
  def overdue?
    !completed? && self.due_on && self.due_on < Time.now
  end
  
  private
  
  ## Parse the contents of the text field on save and ensure that the appropriate values are entered
  ## into the appropriate fields in the database.
  def parse_text
    return if self.text.blank?
    
    ## Assign to users
    self.text.gsub!(/\@(\w+)/) do
      self.user = User.find_by_username($1)
      self.user ? '' : "@#{$1}"
    end
    
    ## Assign to projects
    self.text.gsub!(/\#([\w\-]+)/) do
      self.project = Project.find_or_create_by_tag($1)
      ''
    end
    
    ## Set the dates. Note this will only match days and times which do not include
    ## spaces.
    self.text.gsub!(/(by|on)\:([\w-]+)/) do
      self.due_on = Chronic.parse($2)
      ''
    end
    
  end
  
end
