class Item < ApplicationRecord
validates :goods, presence: true
validates :information, presence: true
validates :price, presence: true
validates :category_id, presence: true
validates :condition_id, presence: true
validates :cost_burden_id, presence: true
validates :prefectures_id, presence: true
validates :aim_id

belongs_to :user
has_one_attached :image
# has_one :purchase
# belongs_to_active_hash :category_id
# belongs_to_active_hash :condition_id
# belongs_to_active_hash :cost_burden_id
# belongs_to_active_hash :prefectures_id
# belongs_to_active_hash :aim_id

end
