require_relative '../lib/tire_pressure'

RSpec.describe Alarm do

  describe '#check' do

    before do
      allow(Sensor).to receive(:sample_pressure).and_return(sample_pressure)
      subject.check
    end

    context 'pressure is too high' do
      let(:sample_pressure) { 20 }

      it 'turns on the alarm when pressure is too high' do
        expect(subject.is_alarm_on).to be true
      end
    end

    context 'pressure is too low' do
      let(:sample_pressure) { 0 }

      it 'turns on the alarm when pressure is too low' do
        expect(subject.is_alarm_on).to be true
      end
    end

    context 'pressure is OK' do
      let(:sample_pressure) { 3 }

      it 'does not turn on the alarm' do
        expect(subject.is_alarm_on).to be false
      end
    end
  end
end
