class Outfit
  attr_reader :wear, :wear_type, :temp_range
  def initialize(params)
    @wear = params[:wear]
    @wear_type = params[:wear_type]
    @temp_range = params[:temp_range]
  end

  def weather_compatible?(temp)
    @temp_range.include?(temp)
  end

  def to_s
    "#{@wear_type}: #{@wear} #{@temp_range}"
  end
end
