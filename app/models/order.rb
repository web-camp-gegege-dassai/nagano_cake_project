class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {"クレジットカード": 0, "銀行振り込み": 1}
  enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}



  def billing(order)
    current_cart = current_customer.cart_items
    total_price(current_cart) + order.shipping_cost
  end

end
