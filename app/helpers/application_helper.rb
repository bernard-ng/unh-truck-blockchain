module ApplicationHelper
  def is_admin?
    current_user.id && current_user.role == "ADMIN"
  end
end
