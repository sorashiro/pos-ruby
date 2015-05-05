require_relative "fixtures"
require_relative "model/pos"
require_relative "model/item"
require_relative "model/cart"
require_relative "model/cart-item"
require_relative "model/convert"

def main(inputs)
  cart = Cart.new
  convert = Convert.new
  items = load_all_items

  cart_items = convert.load_items(items, inputs)
  cart.uniq_items(cart_items)

  pos = Pos.new(cart)
  pos.print_inventory()
end

  inputs = [
      "ITEM000001",
      "ITEM000001",
      "ITEM000001",
      "ITEM000001",
      "ITEM000001",
      "ITEM000003-2",
      "ITEM000005",
      "ITEM000005",
      "ITEM000005"
  ];
main(inputs)
