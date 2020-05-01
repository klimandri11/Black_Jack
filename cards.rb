class Card
  SUITS = ["+","<3", "^", "<>"].freeze
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "V", "Q", "K", "A"].freeze
  attr_accessor :value, :suit

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
