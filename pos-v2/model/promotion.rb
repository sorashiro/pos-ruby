class Promotion
  attr_reader :type
  attr_reader :barcodes

  def initialize(type, barcodes)
    @type = type
    @barcodes = barcodes
  end
end
