class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能(ユーザ登録、ログイン認証など)が使われる前に
  # configure_permitted_parametersメソッドが実行される
  
  def after_sign_in_path_for(resource)
    # サインイン後にどのページに遷移するかを設定している
    about_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter~メソッドを使うことでユーザー登録（sign_up）の際に、ユーザー名(name)のデータ操作を許可しています
  end
end
