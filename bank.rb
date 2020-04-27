class Bank
  attr_reader :total_money

  def initialize
    @total_money = 100
  end

  def stavka
    @total_money -= 10
  end

end
