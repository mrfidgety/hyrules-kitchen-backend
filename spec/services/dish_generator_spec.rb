require 'rails_helper'

RSpec.describe DishGenerator do
  shared_examples 'generates expected dish' do
    def fetch_ingredients(*ingredient_names)
      ingredient_names.map { |name| Ingredient.find_by(name: name) }
    end

    def fetch_effect(effect_name)
      Effect.find_by(name: effect_name)
    end

    let(:expected_effect) { {} }
    let(:ingredients) { fetch_ingredients(*ingredient_names) }
    let(:dish_keys) { %i[category hearts value] }
    let(:effect_keys) { %i[effect effect_potency duration] }

    subject(:generate_dish) { described_class.generate(*ingredients) }

    it 'generates a dish with the expected attributes' do
      expect(generate_dish.slice(*dish_keys)).to eq(expected_dish),
                                                 dish_failure(ingredient_names, expected_dish)
    end

    it 'generates a dish with the expected effect' do
      expect(generate_dish.slice(*effect_keys)).to eq(expected_effect),
                                                   effect_failure(ingredient_names, expected_effect)
    end

    def dish_failure(ingredients, expected_dish)
      "Expected #{ingredients} to create dish #{expected_dish}"
    end

    def effect_failure(ingredients, expected_effect)
      "Expected #{ingredients} to create dish with effect #{expected_effect}"
    end
  end

  describe 'successful dishes' do
    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Apple'] }
      let(:expected_dish) { { category: 'food', hearts: 1.0, value: 10 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Acorn'] }
      let(:expected_dish) { { category: 'food', hearts: 0.5, value: 10 } }
      let(:expected_name) { 'Sauteed Nuts' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Bird Egg'] }
      let(:expected_dish) { { category: 'food', hearts: 2.0, value: 10 } }
      let(:expected_name) { 'Omelet' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Chickaloo Tree Nut'] }
      let(:expected_dish) { { category: 'food', hearts: 0.5, value: 10 } }
      let(:expected_name) { 'Sauteed Nuts' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Fresh Milk'] }
      let(:expected_dish) { { category: 'food', hearts: 1.5, value: 10 } }
      let(:expected_name) { 'Milk' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Fresh Milk', 'Fresh Milk'] }
      let(:expected_dish) { { category: 'food', hearts: 2.5, value: 10 } }
      let(:expected_name) { 'Milk' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Apple', 'Apple', 'Apple'] }
      let(:expected_dish) { { category: 'food', hearts: 3.0, value: 20 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Hyrule Herb', 'Rock Salt'] }
      let(:expected_dish) { { category: 'food', hearts: 2.0, value: 10 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Bird Egg', 'Goat Butter', 'Rock Salt', 'Hylian Shroom'] }
      let(:expected_dish) { { category: 'food', hearts: 3.0, value: 30 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Bird Egg', 'Hylian Rice'] }
      let(:expected_dish) { { category: 'food', hearts: 4.0, value: 10 } }
      let(:expected_name) { 'Fried Egg and Rice' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Rock Salt', 'Bird Egg'] }
      let(:expected_dish) { { category: 'food', hearts: 2.0, value: 10 } }
      let(:expected_name) { 'Omelet' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Rock Salt', 'Fresh Milk'] }
      let(:expected_dish) { { category: 'food', hearts: 1.0, value: 10 } }
      let(:expected_name) { 'Milk' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Hylian Rice', 'Fresh Milk'] }
      let(:expected_dish) { { category: 'food', hearts: 3.0, value: 10 } }
      let(:expected_name) { 'Milk' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Hylian Rice', 'Raw Prime Meat'] }
      let(:expected_dish) { { category: 'food', hearts: 5.0, value: 40 } }
      let(:expected_name) { 'Meaty Rice Balls' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Raw Meat', 'Hyrule Bass', 'Spicy Pepper'] }
      let(:expected_effect) do
        { effect: fetch_effect('Spicy'), effect_potency: '1/2', duration: 210 }
      end
      let(:expected_dish) { { category: 'food', hearts: 5.0, value: 40 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Silent Shroom', 'Silent Princess', 'Blue Nightshade'] }
      let(:expected_effect) do
        { effect: fetch_effect('Sneaky'), effect_potency: '2/3', duration: 360 }
      end
      let(:expected_dish) { { category: 'food', hearts: 3.0, value: 40 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Fleet-Lotus Seeds', 'Bird Egg', 'Bird Egg'] }
      let(:expected_effect) do
        { effect: fetch_effect('Hasty'), effect_potency: '1/3', duration: 180 }
      end
      let(:expected_dish) { { category: 'food', hearts: 5.0, value: 30 } }
      let(:expected_name) { 'Hasty Omelet' }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Armored Porgy', 'Ironshell Crab', 'Fortified Pumpkin'] }
      let(:expected_effect) do
        { effect: fetch_effect('Tough'), effect_potency: '3/3', duration: 150 }
      end
      let(:expected_dish) { { category: 'food', hearts: 5.0, value: 50 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) do
        ['Stamella Shroom', 'Raw Prime Meat', 'Courser Bee Honey', 'Rock Salt', 'Staminoka Bass']
      end
      let(:expected_effect) do
        { effect: fetch_effect('Energizing'), effect_potency: '9/15', duration: nil }
      end
      let(:expected_dish) { { category: 'food', hearts: 10.0, value: 140 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Endura Carrot', 'Endura Shroom'] }
      let(:expected_effect) do
        { effect: fetch_effect('Enduring'), effect_potency: '2/10', duration: nil }
      end
      let(:expected_dish) { { category: 'food', hearts: 6.0, value: 70 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) do
        ['Chillfin Trout', 'Chillfin Trout', 'Fresh Milk', 'Goat Butter', 'Bird Egg']
      end
      let(:expected_effect) do
        { effect: fetch_effect('Chilly'), effect_potency: '2/2', duration: 550 }
      end
      let(:expected_dish) { { category: 'food', hearts: 7.0, value: 60 } }
    end
  end

  describe 'rock-hard dishes' do
  end

  describe 'dubious dishes' do
    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Cane Sugar'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Goat Butter'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Goron Spice'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Hylian Rice'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Rock Salt'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Tabantha Wheat'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) { ['Hylian Rice', 'Goat Butter', 'Rock Salt'] }
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end

    it_behaves_like 'generates expected dish' do
      let(:ingredient_names) do
        ['Spicy Pepper', 'Goat Butter', 'Hot-footed Frog', 'Fire Keese Wing']
      end
      let(:expected_dish) { { category: 'dubious-food', hearts: 1.0, value: 2 } }
    end
  end
end
