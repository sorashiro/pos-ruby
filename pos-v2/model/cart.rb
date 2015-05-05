require_relative "../fixtures"

class Cart
  attr_accessor :uniq_cart_items
  attr_accessor :total
  attr_accessor :privilege
  attr_accessor :promotions

  def initialize
    @uniq_cart_items = []
    @total = 0
    @privilege = 0
    @promotions = []
  end

  def uniq_items(cart_items)
    cart_items.each do |item|
      exist_item = get_exist_item(item)
      if exist_item then
        exist_item.count += item.count
      else
        @uniq_cart_items.push(item)
      end
    end
  end

  def get_exist_item(cart_item)
    @uniq_cart_items.each do |item|
      if item.get_barcode == cart_item.get_barcode then
        return cart_item
      end
    end
    return nil
  end

  def calculate
    all_promotions = load_promotions

    @uniq_cart_items.each do |cart_item|
      @total += cart_item.get_price * cart_item.count
      cart_item.calculate(all_promotions[0])
      if cart_item.gift then
        @privilege += cart_item.get_price * cart_item.gift.to_i
        @promotions.push(cart_item)
      end
    end
  end
end
