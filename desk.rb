class Desk
  def initialize
    @all_cards = []
  end

  def card_draw(quantity, hand)
    quantity.times do |i|
      volue = $values[rand($values.size)]
      suit = $suits[rand($suits.size)]
      @all_cards << Cards.new(volue, suit)
      hand.add_card(@all_cards.last)
    end
  end

end
