class CoinManager
  attr_reader :balance
  def initialize
    @balance = 0.0
  end

  def add_coins(amount)
    if !amount.nil? && amount > 0
      @balance += amount
    end
    @balance
  end

  def get_balance
    @balance
  end

  def deduct_amount(amount)
    return false if amount > @balance

    @balance -= amount
    true
  end

  def reset_balance
    returned_amount = @balance
    @balance = 0.0
    returned_amount 
  end
end
