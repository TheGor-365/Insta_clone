class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_action :verify_authenticity_token, only: :facebook

  def facebook
    @account = Account.from_omniauth(request.env["omniauth.auth"])

    if @account.persisted?
      sign_in_and_redirect @account
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_account_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
