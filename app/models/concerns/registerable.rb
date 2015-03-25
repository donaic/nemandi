module Registerable
  extend ActiveSupport::Concern

  included do
    has_many :registrations, as: :registerable
    #has_many :roles, through: :registrations#, source: :registerable, source_type: 'Role'
    has_many :users, through: :registrations#, source: :registerable, source_type: 'User'
  end

  public
    # Find all Users for a given role in a given Registrable.
    #
    # For example, this will find all Users who are Students in a given School:
    # => @school.students
    # => returns users who are students
    #
    # def students
    #   User.joins(:registrations)
    #       .where(role = ? AND registerable_id = ? AND registerable_type = ?,
    #              role, registerable.id, registerable.type)
    # end
    Registration.roles.each do |role|
      define_method(role.first.pluralize) do
        conditions = []
        conditions << 'role = ? AND registerable_id = ? AND registerable_type = ?'
        conditions << role.second
        conditions << self.id
        conditions << self.class.name

        User.joins(:registrations).where(conditions)
      end
    end

    def register(authorization, role, *users)
      registered_users = []

      users.each do |user|
          r = Registration.roles[role]
          a = Registration.authorizations[authorization]
          Registration.create!(user: user, registerable: self,
                              role: r, authorization: a)

          registered_users << user
      end
      registered_users
    end

    def registered?(user)
      begin
        conditions = []
        conditions << "registerable_id = ? AND registerable_type = ? AND user_id = ?"
        conditions << self.id
        conditions << self.class.name
        conditions << user.id
      rescue
        false
      else
        User.joins(:registrations).where(conditions).exists?
      end
    end

    def unregister(registerable)

    end

  module ClassMethods

  end
end
