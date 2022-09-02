require 'rails_helper'

RSpec.describe Food, type: :view, js: true do
  before(:each) do
    @user = User.create(name: 'MyjUsesrd', email: 'tsesst3s@gmail.com', password: 'ddddddd')
    @food = @user.foods.create(name: 'Bread',
                               measurement_unit: 'gram',
                               price: 1,
                               quantity: 2000)

    visit root_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'It creates User successfully' do
    expect(User.all.length).to eq 2
  end

  it 'It creates Recipe successfully' do
    expect(@food).to be_valid
  end

  it 'Should display food name' do
    visit foods_path
    expect(page).to have_content('Bread')
  end

  it 'Should display food measurement_unit' do
    visit foods_path
    expect(page).to have_content('gram')
  end

  it 'Should display food price' do
    visit foods_path
    expect(page).to have_content('1')
  end
end
