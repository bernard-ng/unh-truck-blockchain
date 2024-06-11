class Order < ApplicationRecord
  enum :status, %w[pending, canceled, shipped], validated: true
  belongs_to :truck
  belongs_to :user

  after_create :set_default_status

  validates_presence_of :truck_id, :user_id, :shipped_quantity, :shipped_at
  validates_numericality_of :shipped_quantity, greater_than: 0
  # validates_numericality_of :shipped_at, less_than_or_equal_to: Time.current, allow_nil: true

  default_scope -> { order(created_at: :desc) }
  scope :count_shipped_for, -> (user_id) { where(status: ["shipped"], user_id: user_id).count }
  scope :count_unshipped_for, -> (user_id) { where(status: %w[canceled pending], user_id: user_id).count }

  private
  def set_default_status
    update_attribute(:status, "pending")
  end
end
