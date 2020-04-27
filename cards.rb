class Cards
  SUITS = ["+","<3", "^", "<>"]
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "V", "Q", "K", "A"]

  def initialize(value, suit)
    @value = value
    @suit = suit
    validate!
  end

  private

  def validate!
    raise "Некорректное значение карты" unless SUITS.include?(@suit.to_s) && VALUES.include?(@value.to_s)
  end

end
