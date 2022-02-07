require 'rails_helper'

RSpec.describe UserSpec, type: :model do
  describe 'Validations' do
    # validation tests/examples here
      it 'Checks to see if it creates a valid user' do
        @user = User.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: '123', password_confirmation: '123')
        expect(@user).to be_valid
    end
  end
end
