class Order < ApplicationRecord
  enum status: [:shipping, :shipped, :canceled]
  belongs_to :truck
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  scope :count_shipped_for, -> (user_id) { where(status: [:shipped], user_id: user_id).count }
  scope :count_unshipped_for, -> (user_id) { where(status: [:canceled, :shipping], user_id: user_id).count }
end
