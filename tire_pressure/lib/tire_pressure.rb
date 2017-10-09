class Sensor
  OFFSET = 16

  def pop_next_pressure_psi_value
    Sensor::OFFSET + Sensor.sample_pressure()
  end

  def self.sample_pressure
    # placeholder implementation that simulate a real sensor in a real tire
    6 * rand * rand
  end

end

class Alarm

  attr_reader :acceptable_range, :is_alarm_on, :sensor
  private :acceptable_range, :sensor

  def initialize(sensor, acceptable_range)
    @acceptable_range = acceptable_range
    @sensor = sensor
    @is_alarm_on = false
  end

  def check
    @is_alarm_on = !within_acceptable_range?
  end

  private

  def psi_pressure_value
    sensor.pop_next_pressure_psi_value
  end

  def within_acceptable_range?
    acceptable_range.include?(psi_pressure_value)
  end
end
