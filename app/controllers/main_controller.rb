# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @shipped_orders_count = Order.count_shipped_for(current_user.id)
    @unshipped_orders_count = Order.count_unshipped_for(current_user.id)
    @orders = Order.where(:user_id => current_user.id).order(created_at: :desc)
  end
end
