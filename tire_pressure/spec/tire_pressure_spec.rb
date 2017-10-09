require_relative '../lib/tire_pressure'

RSpec.describe Alarm do

  describe '#check' do
    subject { Alarm.new(sensor) }

    let(:sensor) {
      instance_double(
        'Sensor',
        pop_next_pressure_psi_value: pressure
      )
    }

    before do
      subject.check
    end

    context 'pressure is too high' do
      let(:pressure) { 25 }

      it 'turns on the alarm when pressure is too high' do
        expect(subject.is_alarm_on).to be true
      end
    end

    context 'pressure is too low' do
      let(:pressure) { 0 }

      it 'turns on the alarm when pressure is too low' do
        expect(subject.is_alarm_on).to be true
      end
    end

    context 'pressure is OK' do
      let(:pressure) { 19 }

      it 'does not turn on the alarm' do
        expect(subject.is_alarm_on).to be false
      end
    end
  end
end
