# frozen_string_literal: true

require '../lib/wardrobe'
require '../lib/outfit'

RSpec.describe 'Wardrobe' do
  let(:collection) { Wardrobe.from_dir(File.join(__dir__, 'fixtures')) }

  describe '.from_dir' do
    it 'create instance of Wardrobe class' do
      expect(collection).to be_a_kind_of Wardrobe
    end

    it 'assign vars correctly' do
      expect(collection.wardrobe.map(&:wear)).to match_array %w[Кроссовки Шапка Шлепанцы]
      expect(collection.wardrobe.map(&:wear_type)).to match_array ['Головной убор', 'Обувь', 'Обувь']
      expect(collection.wardrobe.map(&:temp_range)).to match_array [-20..-5, 20..40, 0..15]
    end
  end

  describe '#types_outfit' do
    it 'create uniq wear type' do
      expect(collection.types_outfit).to match_array ['Головной убор', 'Обувь']
    end
  end

  describe '#outfit_one_type' do
    let(:shoes_type) { collection.wardrobe.select { |item| item.wear_type == 'Обувь' } }
    it 'select obj which contain one wear_type' do
      expect(collection.outfit_one_type('Обувь')).to eq(shoes_type)
    end
  end

  describe '#outfit' do
    let(:temperature) { collection.wardrobe.select { |item| item.temp_range.include?(5) } }
    it 'select obj which have appropriate temperature' do
      expect(collection.outfit(5)).to eq(temperature)
    end
  end
end
