class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :is_active, presence: true

  
  # 商品画像
  attachment :image
  # 販売ステータス
  def active_for_authentication?
    super && (self.is_deleted == true)
  end
end
