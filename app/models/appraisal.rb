class Appraisal < ActiveRecord::Base
  unloadable
  validates_presence_of :name, :template
  attr_accessible :name, :description, :template
end
