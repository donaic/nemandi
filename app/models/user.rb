class User < ActiveRecord::Base
  ################
  # ASSOCIATIONS #
  ################
  has_one  :credential, dependent: :destroy
  has_many :registrations
  has_many :schools, through: :registrations, source: :registerable, source_type: 'School'
  has_many :klasses, through: :registrations, source: :registerable, source_type: 'Klass'

  ###############
  # VALIDATIONS #
  ###############
  validates_presence_of :credential

  ###########
  # METHODS #
  ###########

end
