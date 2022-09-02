require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'test', email: 'test@gmail.com', password: '123456')

  it 'It creates user successfully' do
    expect(user.name).to eq 'test'
  end
end
