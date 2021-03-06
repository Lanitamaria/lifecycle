# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    respond_to do |format|
      format.json do 
        self.resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        render status: 200, json: resource
      end
      format.html do 
        super
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    # Here you can write logic based on roles to return different after sign in paths
    if current_user.candidate?
      candidate_index_path
    elsif
      current_user.company?
      company_index_path
    else
      current_user.admin
      redirect_to rails_admin_url
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:fullname, :phone, :role])
   end
end
