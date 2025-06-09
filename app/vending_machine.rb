require_relative 'coin_manager'
require_relative 'product_catalog'
require_relative 'transaction_processor'
require_relative 'display_manager'

class VendingMachine
  attr_accessor :products
  def insert(amount)
    @coin_manager.add_coins(amount)
    balance
  end

  def select_product(code)
    product = @product_catalog.find_product(code)

    raise 'No product' if product.nil?
    raise 'Insufficient funds' if balance < product[:price]

    @product_catalog.update_stock(code)
    change = @transaction_processor.process_transaction(product, balance)
    @coin_manager.deduct_amount(product[:price])
    @display_manager.format_transaction_result(product[:name], change)
  end

  def dispense(product)
    @balance
  end

  def balance
    @coin_manager.balance
  end

  def display_products
    @display_manager.format_product_list(@product_catalog.available_products)
  end

  def cancel_transaction
    returned_amount = @coin_manager.reset_balance
    "Returned #{returned_amount}"
  end
end
