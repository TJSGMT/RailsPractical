module OrderHelper

  def total_price(order)
    order.quantity.to_i * order.product1&.price.to_i
  end
end
