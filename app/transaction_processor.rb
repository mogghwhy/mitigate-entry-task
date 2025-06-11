module TransactionFormattable
  def format_transaction_details(transaction)
    "Transaction details: #{transaction[:product]} - Paid: #{transaction[:paid]} - Change: #{transaction[:change]}"
  end
end

class TransactionProcessor
  include TransactionFormattable

  def initialize
    @history = []
  end

  def process_transaction(product, amount_paid)
    change = calculate_change(product[:price], amount_paid)

    transaction = {
      product: product[:name],
      price: product[:price],
      paid: amount_paid,
      change: change,
      timestamp: Time.now
    }

    @history << transaction
    change
  end

  def calculate_change(price, amount_paid)
    amount_paid - price
  end

  def transaction_history
     @history
  end

  def last_transaction_details
    format_transaction_details(@history.last)
  end
end
