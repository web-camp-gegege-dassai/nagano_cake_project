class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: {"クレジットカード": 0, "銀行振り込み": 1}
  
  def billing(order)
    total_price(current_cart) + order.shipping_cost
  end
  
end
