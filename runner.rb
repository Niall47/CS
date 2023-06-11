require 'pry'
require 'dvla/herodotus'
LOG = DVLA::Herodotus.logger
LOG.level = :info

current_file_path = File.expand_path(__FILE__)
ruby_files = Dir.glob(File.join(__dir__, "*.rb"))
ruby_files.reject! { |file| File.expand_path(file) == current_file_path }
LOG.debug "Requiring files #{ruby_files}"
ruby_files.each { |file| require file }


player = Player.new("Jimmy")
game = Game.new(player:)

100.times do
  game.get_crate(type: 'Revolution Case')
end

# player.inventory.items.first.unbox
# player.inventory.display_inventory

100.times do
  player.inventory.get_items_by_type(type: Crate).first.unbox
end

player.inventory.display_inventory