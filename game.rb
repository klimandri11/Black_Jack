class Game
  attr_accessor :bank, :dealer, :player, :deck
  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
    @bank = Bank.new
  end

  def run
    start_game
  end

  private

  def draw_1?
    @player.hand.point > 21 && @dealer.hand.point > 21 || @player.hand.point == @dealer.hand.point
  end

  def draw_2?
    @player.hand.point > 21 || @player.hand.point < @dealer.hand.point && @player.hand.point <= 21 && @dealer.hand.point <= 21
  end

  def draw_3?
    dealer.hand.point > 21 || player.hand.point > dealer.hand.point && player.hand.point <= 21 && dealer.hand.point <= 21
  end

  def start_game
    @interface.name_entry
    begin
    name = gets.capitalize.chomp
    @player = Player.new(name)
  rescue
    puts "Неккоректное имя, введите заново"
    retry
  end
    choise = 2
    while choise != 0
      @interface.show_question_continue
      choise = gets.chomp.to_i
      case choise

      when 1
        new_round

      end
    end
  end

  def reset
    @deck = Deсk.new
    @bank.reset_bank

    @player.hand.card_zeroing
    @player.hand.point_zeroing
    @dealer.hand.card_zeroing
    @dealer.hand.point_zeroing
  end

  def winner
    if draw_1?
      puts "Ничья"
      @dealer.bank.add_money(@bank.total_money / 2)
      @player.bank.add_money(@bank.total_money / 2)
    elsif draw_2?
      @interface.show_winner(@dealer)
      @dealer.bank.add_money(@bank.total_money)
    elsif draw_3?
      @interface.show_winner(@player)
      @player.bank.add_money(@bank.total_money)
    end
    @interface.player_data(@player)
    @interface.player_data(@dealer)
    @interface.print_money(@player)
    @interface.print_money(@dealer)
  end


  def new_round
    if @player.bank.total_money > 0 && @dealer.bank.total_money > 0
      reset
      @player.bank.stavka(10)
      @dealer.bank.stavka(10)

      @bank.add_money(20)
      @deck.card_draw(2, @player.hand)
      @deck.card_draw(2, @dealer.hand)

      @player.hand.scoring
      @dealer.hand.scoring

      @interface.player_data(@player)
      @interface.print_secret_cards(@dealer)
      @interface.show_question
      choise_2 = gets.chomp.to_i
      if choise_2 == 1 && @player.hand.number_cards < 3
        @deck.card_draw(1, @player.hand)
        @player.hand.scoring
        @dealer.comparison_points(@player, @deck)
        winner

      elsif choise_2 == 2
        winner

      elsif choise_2 == 3
        @dealer.comparison_points(@player, @deck)
        winner
      end
    end
  end
end
