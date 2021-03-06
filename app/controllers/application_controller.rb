class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end

  #ログインしないとどのページにも飛べないコード
  #ここに記入すると全てはじかれてしまう
   # before_action :authenticate_user!

   def after_sign_in_path_for(resource)
    # if resource_or_scope.is_a?(AdminUser)
      # admin_root_path
    # else
      user_path(resource)
   end

   def after_sign_out_path_for(resource)
      root_path
   end

end


