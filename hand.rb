class Hand

  def initialize
    @cards = []
    @point = 0
  end

  def add_card(card)
    @cards << card
  end

  def scoring
    @cards.each do |card|
      if card.value.to_i == 0
        @point += 10
      elsif card.value == 'A'
        if @point <= 10
          @point += 11
        else
          @point += 1
        end
      else
        @point += card.value.to_i
      end
    end
  end

end
