require_relative "cart-item"
class Convert

  def load_items(items, inputs)
    cart_items = []

    items.each do |item|
      cart_item = Cart_item.new(item, 0)

      inputs.each do |input|
        barcode_split = input.split('-')
        number = barcode_split[1] || 1

        if item.barcode == barcode_split[0] then
          cart_item.count += number.to_i
        end
      end

      if cart_item.count > 0 then
        cart_items.push(cart_item)
      end
    end
    return cart_items
  end
end
