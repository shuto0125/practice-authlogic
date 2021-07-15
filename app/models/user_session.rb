class UserSession < Authlogic::Session::Base
  single_access_allowed_request_types :all
  # クエリストリングのキーを変更したい場合（デフォルトは user_credentials）
  # params_key :api_key

  secure Rails.env.production?
  httponly true #document.cookieをJavaScriptで読み出せなくする
end
