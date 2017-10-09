require_relative '../lib/tire_pressure'

RSpec.describe Alarm do

  describe '#is_alarm_on' do
    let(:subject) { alarm.is_alarm_on }

    let(:acceptable_range) { (17..21) }
    let(:alarm) { Alarm.new(sensor, acceptable_range) }
    let(:sensor) {
      instance_double(
        'Sensor',
        pop_next_pressure_psi_value: pressure
      )
    }

    context 'pressure is too high' do
      let(:pressure) { 25 }

      it { should be true }
    end

    context 'pressure is too low' do
      let(:pressure) { 0 }

      it { should be true }
    end

    context 'pressure is OK' do
      let(:pressure) { 19 }

      it { should be false }
    end
  end
end
