# frozen_string_literal: true

require '../lib/wardrobe'
require '../lib/outfit'

describe 'Outfit' do
  let(:params) do
    { wear: 'Шапка вязанная', wear_type: 'Головной убор', temp_range: -5..15 }
  end
  let(:item) { Outfit.new(params) }

  describe '.initialize' do
    it 'assign vars correctly' do
      expect(item.wear).to eq 'Шапка вязанная'
      expect(item.wear_type).to eq 'Головной убор'
      expect(item.temp_range).to eq(-5..15)
    end
  end

  describe '#weather_compatible?' do
    context 'when transferred matched temp' do
      it 'return true' do
        expect(item.weather_compatible?(5)).to be true
      end
    end

    context 'when transferred not matched temp' do
      it 'return false' do
        expect(item.weather_compatible?(-10)).to be false
      end
    end
  end

  describe '#to_s' do
    it 'return correct string' do
      expect(item.to_s).to eq 'Головной убор: Шапка вязанная -5..15'
    end
  end
end
