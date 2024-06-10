module ApplicationHelper
  def is_admin?
    current_user && current_user.role == "ADMIN"
  end
end
