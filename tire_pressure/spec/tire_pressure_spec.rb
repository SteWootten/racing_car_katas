require_relative '../lib/tire_pressure'

RSpec.describe Alarm do

  describe '#check' do

    before do
      allow(Sensor).to receive(:sample_pressure).and_return(20)
      subject.check
    end

    it 'turns on the alarm when pressure is too high' do
      expect(subject.is_alarm_on).to be true
    end
  end
end
