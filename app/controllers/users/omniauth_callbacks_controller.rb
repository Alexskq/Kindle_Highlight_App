class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def amazon
      @user = User.from_omniauth(request.env['omniauth.auth'])
      sign_in_and_redirect @user
    end
  end
  