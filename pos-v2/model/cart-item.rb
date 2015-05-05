class Cart_item
  attr_accessor :item
  attr_accessor :count
  attr_accessor :gift
  attr_accessor :privilege
  attr_accessor :sub_total

  def initialize(item, count)
    @item = item
    @count = count
    @gift = 0
    @privilege = 0
    @sub_total = 0
  end

  def calculate(promotion)
    if promotion.barcodes.include?(@item.barcode) then
      @gift = @count / 3
    end
      @sub_total = @item.price * (@count - @gift.to_i)
  end

  def get_barcode
    @item.barcode
  end

  def get_price
    @item.price
  end

  def get_name
    @item.name
  end

  def get_unit
    @item.unit
  end
end
