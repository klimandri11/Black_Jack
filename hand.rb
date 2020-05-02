class Hand
  attr_accessor :cards, :point, :number_cards

  def initialize
    @cards = []
    @point = 0
    @number_cards = 0
  end

  def add_card(card)
    @cards << card
    @number_cards += 1
  end

  def scoring
    @point = 0
    number_aces = 0
    number_tens = 0
    @cards.each do |card|
      if card.value == 'A'
        if @point <= 10
          @point += 11
          number_aces += 1
        else
          @point += 1
        end
      elsif card.value.to_i == 0 || card.value.to_i == 10
        @point += 10
        number_tens += 1
      else
        @point += card.value.to_i
      end
    end
    @point -= 10 if number_tens == 1 && number_aces == 2
  end

  def card_zeroing
    @number_cards = 0
    @cards = []
  end

  def point_zeroing
    @point = 0
  end

end
