class Pos
  def print_inventory(inputs)
    text = ""
    total = 0
    items = inputs.uniq

    inputs.each do |input|
      total += input[:price]

      items.each do |item|
        item[:count] = item[:count] || 0

        if input[:barcode] == item[:barcode] then
          item[:count] += 1
        end
      end
    end

    items.each do |item|
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
end

inputs = [
            {
                barcode: 'ITEM000000',
                name: '可口可乐',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000000',
                name: '可口可乐',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000000',
                name: '可口可乐',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000000',
                name: '可口可乐',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000000',
                name: '可口可乐',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000001',
                name: '雪碧',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000001',
                name: '雪碧',
                unit: '瓶',
                price: 3.00
            },
            {
                barcode: 'ITEM000004',
                name: '电池',
                unit: '个',
                price: 2.00
            }
          ]
  pos = Pos.new
  puts pos.print_inventory(inputs)
