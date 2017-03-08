module ApplicationHelper
  def current_user
    id = cookies.permanent[:id]
    return User.find(id) if id && User.exists?(id)
    nil
  end
  def logged_in?
    !!current_user
  end
end
