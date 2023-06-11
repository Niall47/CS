class Player < Inventory
  attr_accessor :name, :uuid, :inventory

  def initialize(name)
    @name = name
    @uuid = SecureRandom.uuid
    @inventory = Inventory.new
  end

  def trade_up
    # here we can take 10 items and swap for one item of the higher class
    # would need to figure out which cases are needed
  end

  def add_item(item:)
    @inventory.items << item if item.is_a?(Item)
  end

  def exchange(crate:, skin:)
    exists = @inventory.items.delete(crate)
    if exists
      self.add_item(item: skin)
    else
      raise "Failed to exchange #{crate.inspect} - #{skin.inspect}"
    end
  end
end
