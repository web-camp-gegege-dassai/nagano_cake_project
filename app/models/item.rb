class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
  attachment :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  
end
