class UserSession < Authlogic::Session::Base
  secure Rails.env.production?
  httponly true #document.cookieをJavaScriptで読み出せなくする
end