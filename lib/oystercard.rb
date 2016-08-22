class Oystercard

  attr_reader :balance, :limit

  DEFAULT_LIMIT = 90
  DEFAULT_BALANCE = 0

  def initialize(limit = DEFAULT_LIMIT, balance = DEFAULT_BALANCE)
    @limit = limit
    @balance = balance
    @in_journey = false
    fail 'Balance cannot be larger than limit' if balance > limit
  end

  def top_up(amount)
    fail 'Balance limit reached' if full? || amount > limit
    @balance += amount
    balance_confirmation
  end

  def deduct(amount)
    fail 'Insufficient funds' if amount > balance
    @balance -= amount
    balance_confirmation
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def full?
    balance >= limit
  end

  def balance_confirmation
    "Your new balance is #{balance}"
  end

end
