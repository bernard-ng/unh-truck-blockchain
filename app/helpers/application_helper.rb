# frozen_string_literal: true

module ApplicationHelper
  def is_admin?
    current_user && current_user.role == 'ADMIN'
  end
end
