class Credentials::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  #before_action :set_credential,        only: [:show, :destroy]
  # GET /resource/sign_in
  def new
    p 'new'
    #super
  end

  # POST /resource/sign_in
  def create
     p 'create'
     #super
  end

  # DELETE /resource/sign_out
  def destroy
    p 'destroy'
     #super
  end

  #protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
