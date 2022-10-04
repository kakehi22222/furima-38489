class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true, unless: :was_attached?
  validates :item_info, presence: true
  validates :item_price, presence: true, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999},format:{with: /\A[0-9]+\z/}
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :cost_burden_id, presence: true
  validates :prefectures_id, presence: true
  validates :aim_id, presence: true
  validates :category_id, :condition_id, :cost_burden_id, :prefectures_id, :aim_id, numericality: { other_than: 1 , message: "can't be blank"}

  def was_attached?
    self.image.attached?
  end

  belongs_to :user
  has_one_attached :image
  # has_one :purchase

  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :cost_burden_id
  belongs_to_active_hash :prefectures_id
  belongs_to_active_hash :aim_id

end
