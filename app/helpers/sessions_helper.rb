module SessionsHelper
  # ユーザ情報(id)をセッションに乗せる
  def log_in(user)
    session[:user_id] = user.id
  end
end
