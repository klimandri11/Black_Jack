class Interface

  def name_entry
    puts "Введите ваше имя:"
  end

  def player_data(player)
    puts "Имя игрока: #{player.name} "
    puts "Карты:"
    player.hand.cards.each { |card| puts "#{card.value}#{card.suit} " }
    puts "Очки: #{player.hand.point}"
  end

  def print_secret_cards(dealer)
    puts "#{dealer.name}: "
    dealer.hand.cards.each { |card| puts ' * ' }
  end

  def print_money(player)
    puts "#{player.name} Деньги: #{player.bank.total_money}"
  end

  def show_question
    puts "1 - взять карту"
    puts "2 - открыть карты"
    puts "3 - пропустить"
  end

  def show_question_continue
    puts "1 - сделать ставку"
    puts "0 - прекратить игру"
  end

  def show_winner(player)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!---------"
    puts "Выиграл: #{player.name}"
    puts "---------------------------------"
  end


end
