require "minitest/autorun"
require_relative "pos_v0"

describe Pos do
  describe "print_inventory" do
      pos = Pos.new
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

    it "should print correct text" do
      pos.print_inventory(inputs)
      expect_text =
        "***<没钱赚商店>购物清单***\n" +
        "名称: 可口可乐, 数量: 5瓶, 单价: 3.00(元), 小计: 15.00(元)\n" +
        "名称: 雪碧, 数量: 2瓶, 单价: 3.00(元), 小计: 6.00(元)\n" +
        "名称: 电池, 数量: 1个, 单价: 2.00(元), 小计: 2.00(元)\n" +
        "----------------------\n" +
        "总计: 23.00(元)\n" +
        "**********************"

      assert_equal(expect_text, pos.print_inventory(inputs))
    end
  end
end
