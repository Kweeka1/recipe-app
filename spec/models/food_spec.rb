require 'rails_helper'
require 'capybara/rspec'

Capybara.default_driver = :selenium

RSpec.describe 'Food', type: :feature do
  subject do
    @user = User.create(name: 'Selma', email: 'selmandapanda@yahoo.com', password: '00000000Hs')
    @food = Food.create(name: 'Sugar', user_id: @user.id, measurement_unit: 'grams', price: 10, quantity: 2)
  end

  describe 'validations' do
    it 'is not valid without a name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end

    it 'name should not be longer than 70 characters' do
      food = Food.new(name: 'Salt' * 16)
      expect(food).to_not be_valid
    end

    it 'is not valid without a user_id' do
      food = Food.new(user_id: nil)
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      food = Food.new(measurement_unit: nil)
      expect(food).to_not be_valid
    end

    it 'should have a number for measurement_unit' do
      food = Food.new(measurement_unit: 'grams')
      expect(food).to_not be_valid
    end

    it 'is not valid without a price' do
      food = Food.new(price: nil)
      expect(food).to_not be_valid
    end

    it 'should be a number(price)' do
      food = Food.new(price: '10')
      expect(food).to_not be_valid
    end
  end
end
