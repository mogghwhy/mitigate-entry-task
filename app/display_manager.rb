require_relative 'transaction_processor'

class DisplayManager
  include TransactionFormattable

  def initialize(transaction_processor)
    @transaction_processor = transaction_processor
  end

  def format_product_list(products)
     formatted_product_list = ["Available Products:\n"]
     products.each do |product_code, product|
       formatted_product_list.push(" #{product_code} - #{product[:name]} - #{product[:price]}\n")
     end

     formatted_product_list.join
  end

  def format_transaction_result(product_name, change)
    basic_result = "Dispensed #{product_name} with change #{change}"
    last_transaction = @transaction_processor.last_transaction_details

    basic_result
  end
end
