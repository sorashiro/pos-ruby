def print_inventory(inputs)
  text      = ""
  sub_total = 0
  total     = 0

  inputs.each do |input|
    sub_total = input[:price] * input[:count]
    text += "名称: #{input[:name]}, 数量: #{input[:count]}#{input[:unit]}, "+
            "单价: #{format('%.2f', input[:price])}(元), 小计: #{format('%.2f', sub_total)}(元)\n"
    total += sub_total
  end

  header = "***<没钱赚商店>购物清单***\n"
  footer = "----------------------\n"+
           "总计: #{format('%.2f', total)}(元)\n"+
           "**********************"
  list = header + text + footer
end
    inputs = [
      {
        barcode :  "ITEM000000",
        name    :  "可口可乐",
        unit    :  "瓶",
        price   :  3.00,
        count   :  5
      },
      {
        barcode : "ITEM000001",
        name    : "雪碧",
        unit    : "瓶",
        price   : 3.00,
        count   : 2
      },
      {
        barcode :  "ITEM000004",
        name    :  "电池",
        unit    :  "个",
        price   :  2.00,
        count   :  1
      }
    ]

puts print_inventory(inputs)
