class Item
  attr_reader :barcode
  attr_reader :name
  attr_reader :unit
  attr_reader :price

  def initialize(barcode, name, unit, price)
    @barcode = barcode
    @name = name
    @unit = unit
    @price = price
  end
end
