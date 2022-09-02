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

    visit root_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'It creates User successfully' do
    expect(User.all.length).to eq 2
  end

  it 'It creates Recipe successfully' do
    expect(@recipe).to be_valid
  end

  it 'Should display Recipe name' do
    visit recipes_path
    # click_link 'Liam'
    expect(page).to have_content('MyRecipe')
  end

  it 'Should display Recipe description' do
    visit recipes_path
    # click_link 'Liam'
    expect(page).to have_content('MyRecipe description')
  end
end
