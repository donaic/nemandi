class Registration < ActiveRecord::Base
  ################
  # ASSOCIATIONS #
  ################
  belongs_to :registerable, polymorphic: true
  belongs_to :user

  #############
  # VARIABLES #
  #############
  enum authorization: [:no_auth, :read, :content, :write] #maybe read write admin?
  enum role: [:student, :teacher, :principal, :observer,
              :superintendent, :vice_principal, :teaching_aid, :substitute]

  ###############
  # VALIDATIONS #
  ###############
  validates_presence_of :user, :role, :registerable

  ###########
  # METHODS #
  ###########
end
