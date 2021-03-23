class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true
  
  # 商品画像
  attachment :image
  # 販売ステータス
  enum is_active: { '販売中': true, '販売停止中': false }

end
