class Skin < Item
  attr_accessor :name, :rarity, :weapon, :design, :float, :pattern, :wear

  def initialize(name:, rarity:, weapon:, design:)

    @float = rand.round(10)
    @pattern = rand(1000)
    @name = name
    @rarity = rarity
    @weapon = weapon
    @design = design
    @wear = get_wear
    super()
  end

  def get_wear
    case @float
    when 0.0...0.2
      "Factory New"
    when 0.2...0.4
      "Minimal Wear"
    when 0.4...0.6
      "Field Tested"
    when 0.6...0.8
      "Well Worn"
    when 0.8..1.0
      "Battle Scarred"
    else
      raise "Invalid float: #{@float}"
    end
  end
end

