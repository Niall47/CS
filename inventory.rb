class Inventory

  attr_reader :items

  def initialize
    @items = []
    super()
  end

  def display_inventory
    @items.each {|item| puts "#{item.name} - #{item.wear if item.respond_to? :wear}"}
  end

  def get_items_by_type(type:)
    @items.find_all { |item| item.class == type}
  end

end
