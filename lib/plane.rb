class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def update_status
    @flying = true ? @flying == false : @flying == true
  end
end
