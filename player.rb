class Player
  attr_accessor :bank, :hand, :name
  NAME_FORMAT = /^([a-z])+$/i

  def initialize(name)
    @name = name
    validate!
    @bank = Bank.new
    @hand = Hand.new
  end

  def validate!
    raise "Некорректное имя" if @name !~ NAME_FORMAT
  end
end
