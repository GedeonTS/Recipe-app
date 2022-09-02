require 'rails_helper'

RSpec.describe Food, type: :view, js: true do
  before(:each) do
    @user = User.create(name: 'MyjUsesrd', email: 'tsesst3s@gmail.com', password: 'ddddddd')
    @recipe = @user.recipes.create(name: 'MyRecipe',
                                   preparation_time: 1,
                                   cooking_time: 1,
                                   description: 'MyRecipe description',
                                   public: 'yes',
                                   user_id: @user.id)

    @food = @user.foods.create(name: 'Bread',
                               measurement_unit: 'gram',
                               price: 1,
                               quantity: 2000)

    @food_two = @user.foods.create(name: 'Meat',
                                   measurement_unit: 'kilos',
                                   price: 4,
                                   quantity: 200)

    @recipe_food = @recipe.recipe_foods.create(
      food_id: @food.id,
      quantity: 12
    )
    visit root_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'Should display Food name' do
    visit shoppings_path
    expect(page).to have_content('Meat')
  end

  it 'Should display theAmount of food items to buy' do
    visit shoppings_path
    expect(page).to have_content('1')
  end

  it 'Should display Total value of food needed' do
    visit shoppings_path
    expect(page).to have_content('$4')
  end

  it 'Should display the value of each food needed' do
    visit shoppings_path
    expect(page).to have_content('$4')
  end
end
