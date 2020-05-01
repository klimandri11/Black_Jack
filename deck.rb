class Deсk
  def initialize
    @cards = []
    Card::VALUES.each do |value|
      Card::SUITS.each do |suit|
        @cards<< Card.new(value, suit)
      end
    end
  end

  def card_draw(quantity, hand)
    quantity.times do |i|
      @cards.shuffle!
      hand.add_card(@cards.last)
    end
  end

end
