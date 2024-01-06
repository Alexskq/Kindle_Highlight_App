class ApplicationController < ActionController::Base
  # ! need to be check

  
  protect_from_forgery with: :exception, except: [:verify_authenticity_token] 
  #skip_before_action :verify_authenticity_token 
  before_action :authenticate_user!

end
