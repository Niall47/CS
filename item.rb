require 'securerandom'
require_relative 'constants'

class Item
  attr_accessor :asset_id, :name

  def initialize
    @asset_id = SecureRandom.uuid
    @name = name
  end

end

