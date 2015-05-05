require_relative "fixtures"

def print_inventory(inputs)
  items = load_all_items
  promotions = load_promotions

  item_list       = ''
  promotion_list  = ''
  total           = 0
  bargin          = 0
  cart_items      = []
  uniq_cart_items = []
  barcodes        = []

  inputs.each do |barcode|
    cart_item = barcode.split('-')
    barcodes.push(cart_item[0])

    items.each do |item|
      if cart_item[0] == item[:barcode]
        single_item = Marshal.load(Marshal.dump(item))
        single_item[:count] = cart_item[1] || 1

        cart_items.push(single_item)
      end
    end
  end

  uniq_barcodes = barcodes.uniq

  items.each do |item|
    uniq_barcodes.each do |barcode|
      if item[:barcode] == barcode
        uniq_cart_item = Marshal.load(Marshal.dump(item))
        uniq_cart_items.push(uniq_cart_item)
      end
    end
  end

   cart_items.each do |cart_item|
     uniq_cart_items.each do |uniq_item|
       uniq_item[:count] = uniq_item[:count] || 0

       if cart_item[:barcode] == uniq_item[:barcode] then
         uniq_item[:count] += cart_item[:count].to_i
       end
     end
   end

   uniq_cart_items.each do |item|
     if promotions[0][:barcodes].include?(item[:barcode]) then
       item[:gift] = item[:count] / 3
       item[:sub_total] = item[:price] * (item[:count] - item[:gift].to_i)
     else
       item[:sub_total] = item[:price] * item[:count]
     end
     total += item[:price] * item[:count].to_i
   end

   uniq_cart_items.each do |item|
     item_list += "名称: #{item[:name]}, 数量: #{item[:count]}#{item[:unit]}, "+
             "单价: #{format('%.2f', item[:price])}(元), 小计: #{format('%.2f', item[:sub_total])}(元)\n"
     if item[:gift] then
       promotion_list += "名称: #{item[:name]}, 数量: #{item[:gift]}#{item[:unit]}\n"
       bargin += item[:price] * item[:gift].to_i
     end
   end

   header = "***<没钱赚商店>购物清单***\n"
   middle = "----------------------\n" +
            "挥泪赠送商品: \n"
   footer = "----------------------\n" +
            "总计: #{format('%.2f', total-bargin)}(元)\n" +
            "节省: #{format('%.2f', bargin)}(元)\n" +
            "**********************"
   list = header + item_list + middle + promotion_list + footer
   list
end
