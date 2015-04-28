require_relative "fixtures"

def print_inventory(inputs)

  items = load_all_items

  text = ""
  total = 0
  cart_items = []

  inputs.each do |input|
    items.each do |item|
      if input == item[:barcode] then
        cart_items.push(item)
      end
    end
  end

  uniq_cart_items = cart_items.uniq

  cart_items.each do |cart_item|
    total += cart_item[:price]

    uniq_cart_items.each do |uniq_item|
      uniq_item[:count] = uniq_item[:count] || 0

      if cart_item[:barcode] == uniq_item[:barcode] then
        uniq_item[:count] += 1
      end
    end
  end

  uniq_cart_items.each do |item|
    sub_total = item[:price] * item[:count]
    text += "名称: #{item[:name]}, 数量: #{item[:count]}#{item[:unit]}, "+
            "单价: #{format('%.2f', item[:price])}(元), 小计: #{format('%.2f', (item[:price] * item[:count]))}(元)\n"
  end

  header = "***<没钱赚商店>购物清单***\n"
  footer = "----------------------\n"+
           "总计: #{format('%.2f', total)}(元)\n"+
           "**********************"
  list = header + text + footer
  list
end

inputs = [
          'ITEM000000',
          'ITEM000000',
          'ITEM000000',
          'ITEM000000',
          'ITEM000000',
          'ITEM000001',
          'ITEM000001',
          'ITEM000004'
         ]

puts print_inventory(inputs)
