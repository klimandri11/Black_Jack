class Cards
  $suits = ["+","<3", "^", "<>"]
  $values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "V", "Q", "K", "A"]
  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    validate!
  end

  private

  def validate!
    raise "Некорректное значение карты" unless $suits.include?(@suit.to_s) && $values.include?(@value.to_s)
  end

end
