class Bank
  attr_reader :total_money
  TOTAL_MONEY = 100

  def initialize
    @total_money = TOTAL_MONEY
  end

  def stavka(value)
    if value <= @total_money
      @total_money -= value
    end
  end

  def add_money(value)
    @total_money += value
  end

  def reset_bank
    @total_money = 0
  end

end
