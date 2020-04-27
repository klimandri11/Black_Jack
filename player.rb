class Player

  def initialize(name)
    @player_name = name
    @bank = Bank.new
    @hand = Hand.new
    @number_cards = 0
  end

end
