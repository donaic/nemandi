class UsersController < ApplicationController
  before_action :set_user,only: [:show, :edit]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  protected

    def set_user
      @user = User.find(params[:id])
    end
end
