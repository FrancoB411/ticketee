class Api::V1::BaseController < ActionController::Base
  before_filter :authenticate_user
  before_filter :find_project, only: [:show]
  respond_to :json, :xml
  
  private
    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])
      unless @current_user
        respond_with({:error => "Token is invalid." })
      end
    end
    
    def current_user
      @current_user
    end
    
    def authorize_admin!    
      if !@current_user.admin? #I took out a level of this line cause it was the same line twice. It just seemed redundant
        error = { :error => "You must be an admin to do that." }
        warden.custom_failure!
        render params[:format].to_sym => error, :status => 401
      end
    end
          
end
