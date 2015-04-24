class Appraisal < ActiveRecord::Base
  unloadable
  validates_presence_of :name, :template
  validates_uniqueness_of :name
  attr_accessible :name, :description, :template, :appraisal_questions_attributes

  has_many :appraisal_questions, dependent: :restrict_with_exception
  accepts_nested_attributes_for :appraisal_questions, allow_destroy: true
end
