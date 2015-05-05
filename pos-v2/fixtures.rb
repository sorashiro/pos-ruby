require_relative "model/item"
require_relative "model/promotion"

def load_all_items
  return [
      Item.new('ITEM000000', '可口可乐', '瓶', 3.00),
      Item.new('ITEM000001', '雪碧', '瓶', 3.00),
      Item.new('ITEM000002', '苹果', '斤', 5.50),
      Item.new('ITEM000003', '荔枝', '斤', 15.00),
      Item.new('ITEM000004', '电池', '个', 2.00),
      Item.new('ITEM000005', '方便面', '袋', 4.50)
  ]
end

def load_promotions
  return [
    Promotion.new('BUY_TWO_GET_ONE_FREE', [
      'ITEM000000',
      'ITEM000001',
      'ITEM000005'
    ])
  ]
end
