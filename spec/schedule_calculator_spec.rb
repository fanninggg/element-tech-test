# frozen_string_literal: true

require_relative '../schedule_calculator'

RSpec.describe ScheduleCalculator do
  before do
    @calculator = ScheduleCalculator.new(1610)
  end

  describe '#initialize' do
    it 'creates a new instance of calculator when passed a time integer' do
      expect(@calculator).to be_instance_of(ScheduleCalculator)
    end
  end

  describe '#next_trigger' do
    it 'returns an integer if there are schedule triggers in the future' do
      expect(@calculator.next_trigger([1620, 1630])).to be_a_kind_of(Numeric)
    end

    it 'returns the next time if there are schedule triggers in the future' do
      expect(@calculator.next_trigger([1600, 1620, 1630])).to eq(1620)
    end

    it 'returns the current time if the current time is a scheduled trigger' do
      expect(@calculator.next_trigger([1600, 1610, 1620, 1630])).to eq(1610)
    end

    it 'returns nil if there are no scheduled triggers in the future ' do
      expect(@calculator.next_trigger([1601, 1602, 1603, 1604])).to eq(nil)
    end
  end
end
