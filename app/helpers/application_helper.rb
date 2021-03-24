module ApplicationHelper
  def resource_name
   :customer
  end

  def resource
   @resource ||= Customer.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:customer]
  end
  
  def tax_price(price)
   (price * 1.1).floor
  end
  
  def sub_price(sub)
    (tax_price(sub.item.price) * sub.amount)
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
        price  +=  sub_price(total)
    end
    return price
  end
  
  
  

end
