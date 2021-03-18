class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top,:about]

  protect_from_forgery with: :exception

  # 非ログイン時に遷移先を指定するメソッド定義
  # protected

  # def redirect_root
  #   redirect_to root_path unless customer_signed_in?
  # end

end
