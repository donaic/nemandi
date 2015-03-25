module UsersHelper
  public
    # Returns TRUE is this User is the same as the User trying
    # to access the page.
    #def correct_user?(user)
    #  user == current_user
    #end

    def to_s
      @user.first_name
    end

    def name
      @user.first_name + ' ' + @user.last_name
    end
end
