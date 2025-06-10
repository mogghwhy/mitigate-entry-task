class ProductCatalog
  def initialize
    @products = {
      'A1' => { name: 'Chips crunchy', price: 1.5, stock: 3 },
      'B2' => { name: 'Soda Pop', price: 2.0, stock: 3 },
      'C3' => { name: 'Candy-Crush', price: 1.5, stock: 3 }
    }
  end

  def available_products
    @products
  end

  def find_product(code)
    return nil unless @products[code]

    {
      code: code,
      name: @products[code][:name],
      price: @products[code][:price],
      stock: @products[code][:stock]
    }
  end

  def update_stock(code)
    return false unless @products[code] && @products[code][:stock] > 0

    @products[code][:stock] -= 1
    true
  end
end
