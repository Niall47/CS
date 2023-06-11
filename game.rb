class Game
  attr_accessor :player

  def initialize(player:)
    @player = player
  end

  def get_crate(type:)
    Crate.new(player: @player, type: )
  end
end