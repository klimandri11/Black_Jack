class Dealer < Player

  def initialize(name = 'Dealer')
    super
  end

  def comparison_points(player, deck)
    if @hand.point < 17 && player.hand.point <= 21
      deck.card_draw(1, @hand)
      @hand.scoring
    end
  end

end
