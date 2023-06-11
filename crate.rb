require_relative 'item'

class Crate < Item
attr_accessor :id, :type

  def initialize(type:, player:)
    @id = :dummy_id
    @type = type
    @name = type
    @player = player
    @player.add_item(item: self)
    super()
  end

  def select_rarity
    total_weight = RARITIES.values.sum
    weighted_rarities = RARITIES.flat_map { |rarity, weight| [rarity] * (weight.to_f / total_weight * 100).to_i }
    weighted_rarities.shuffle.sample
  end

  def unbox
    crate = CASES[@type]
    rarity = select_rarity
    names = crate[rarity].is_a?(Array) ? crate[rarity] : [crate[rarity]]
    name = names.sample

    weapon, design = name.split(' | ')

    unboxed_skin = Skin.new(name:, rarity:, weapon:, design:)
    LOG.debug "#{@player.name} unboxed: #{unboxed_skin.inspect}"
    @player.exchange(crate: self, skin: unboxed_skin)
    unboxed_skin

  end
end
