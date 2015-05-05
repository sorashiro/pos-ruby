class Pos
  def initialize(cart)
    @cart = cart
    @item_list = ""
    @promotion_list = ""
  end

  def print_inventory()
    @cart.calculate
    create_item_and_promotion_list(@cart)

    header = "***<没钱赚商店>购物清单***\n"
    middle = "----------------------\n" +
             "挥泪赠送商品: \n"
    footer = "----------------------\n" +
             "总计: #{format('%.2f', @cart.total-@cart.privilege)}(元)\n" +
             "节省: #{format('%.2f', @cart.privilege)}(元)\n" +
             "**********************"
    list = header + @item_list + middle + @promotion_list + footer
    list
  end

  def create_item_and_promotion_list(cart)
    cart.uniq_cart_items.each do |item|
      @item_list += "名称: #{item.get_name}, 数量: #{item.count}#{item.get_unit}, " +
              "单价: #{format('%.2f', item.get_price)}(元), 小计: #{format('%.2f', item.sub_total)}(元)\n"
      if item.gift > 0 then
        @promotion_list += "名称: #{item.get_name}, 数量: #{item.gift}#{item.get_unit}\n"
      end
    end
  end
end
