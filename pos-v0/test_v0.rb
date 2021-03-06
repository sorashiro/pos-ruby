require "minitest/autorun"
require_relative "pos_v0"

describe "print_inventory" do

  inputs = [
            {
              barcode: "ITEM000000",
              name: "可口可乐",
              unit: "瓶",
              price: 3.00,
              count: 5
            },
            {
              barcode: "ITEM000001",
              name: "雪碧",
              unit: "瓶",
              price: 3.00,
              count: 2
            },
            {
              barcode: "ITEM000004",
              name: "电池",
              unit: "个",
              price: 2.00,
              count: 1
            }
           ]

  it "should print correct text" do
    expect_text =
      "***<没钱赚商店>购物清单***\n" +
      "名称: 可口可乐, 数量: 5瓶, 单价: 3.00(元), 小计: 15.00(元)\n" +
      "名称: 雪碧, 数量: 2瓶, 单价: 3.00(元), 小计: 6.00(元)\n" +
      "名称: 电池, 数量: 1个, 单价: 2.00(元), 小计: 2.00(元)\n" +
      "----------------------\n" +
      "总计: 23.00(元)\n" +
      "**********************"

    assert_equal(expect_text, print_inventory(inputs))
  end
end
