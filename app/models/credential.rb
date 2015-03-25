class Credential < ActiveRecord::Base
  ################
  # ASSOCIATIONS #
  ################
  belongs_to :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  ###############
  # VALIDATIONS #
  ###############
  validates_presence_of :email, :encrypted_password

  ##############
  # CALL BACKS #
  ##############
  before_save {self.email = email.downcase unless email.nil?}
end
