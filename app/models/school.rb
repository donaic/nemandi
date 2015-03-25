class School < ActiveRecord::Base
  include Registerable

  ################
  # ASSOCIATIONS #
  ################
  has_many :klasses
  #accepts_nested_attributes_for :klasses

  #############
  # VARIABLES #
  #############
  enum status: [:pending, :active, :inactive, :deleted]

  ###############
  # VALIDATIONS #
  ###############
  validates_presence_of :name

  ###########
  # METHODS #
  ###########
end
