class Project < ActiveRecord::Base
  
  attr_accessible :name, :tag
  
  has_many :tasks, :dependent => :destroy
  
  validates :tag, :presence => true
  
  before_create do
    self.name = self.tag if self.name.blank?
  end
  
end
