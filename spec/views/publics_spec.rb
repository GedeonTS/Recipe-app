require 'rails_helper'

RSpec.describe Recipe, type: :view, js: true do
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

    @recipe_food = @recipe.recipe_foods.create(
      food_id: @food.id,
      quantity: 12
    )

    visit root_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'It creates User successfully' do
    expect(User.all.length).to eq 2
  end

  it 'It creates Public recipe successfully' do
    expect(@recipe).to be_valid
  end

  it 'Should display Public recipe name' do
    visit publics_path
    expect(page).to have_content('MyRecipe')
  end

  it 'Should display the number of Pablic recipes' do
    visit publics_path
    expect(page).to have_content('1')
  end

  it 'Should display the total price of Pablic recipes' do
    visit publics_path
    expect(page).to have_content('$1')
  end
end
