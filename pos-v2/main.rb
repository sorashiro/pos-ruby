require_relative "fixtures"
require_relative "pos"
require_relative "item"
require_relative "cart"
require_relative "cart-item"

def main(inputs)
  cart = Cart.new
  cart_item = Cart_item.new

  cart_items = cart_item.load_items(inputs)
  uniq_cart_items = cart.uniq(cart_items)

  pos = Pos.new(uniq_cart_items)
  pos.print_inventory
end
