class Klass < ActiveRecord::Base
  include Registerable

  ################
  # ASSOCIATIONS #
  ################
  belongs_to  :school

  #############
  # VARIABLES #
  #############
  enum status: [:active, :inactive, :deleted]

  ###############
  # VALIDATIONS #
  ###############
  validates_presence_of :name, :status

  ###########
  # METHODS #
  ###########
  public
    def authorized_to_view?(user)
      if registered?(user)
        return true
      end
      begin
        school_id = self.school.id
        school    = self.school.class.name
        access    = Registration.authorizations[:write]
      rescue
        return false
      else
        conditions = ['registerable_id = ? AND registerable_type = ? AND user_id = ? AND authorization >= ?',
          school_id, school, user.id, access]
        return User.joins(:schools).where(conditions).exists?
      end
    end
end
