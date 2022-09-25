class Wardrobe
  def initialize(wardrobe)
    @wardrobe = wardrobe
  end

  def self.from_dir(path)
    collection = Dir[File.join(path, '*.txt')]
                 .map do |path|
      lines = File.readlines(path, chomp: true)
      Outfit.new(
        wear: lines[0],
        wear_type: lines[1],
        temp_range: Range.new(*lines[2].delete('(').split(',').map(&:to_i))
      )
    end
    self.new(collection)
  end

  def types_outfit
    @wardrobe.map(&:wear_type).uniq
  end

  def outfit_one_type(types_outfit)
    @wardrobe.select { |wear| wear.wear_type == types_outfit }
  end

  def outfit(temprature)
    types_outfit.map do |type|
      outfit_one_type(type)
        .select { |outfit| outfit.weather_compatible?(temprature) }
        .sample
    end.compact
  end
end
