class Weather
  WEATHER = :stormy, :sunny, :sunny, :sunny

  def stormy?
    weather_options == :stormy
  end

  private

  def weather_options
    WEATHER.sample
  end
end
