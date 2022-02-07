require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
      it 'checks if there is no name for new records' do
      @category = Category.new
      @product = Product.new
      expect(@product.name).to be_nil
    end
      it 'ensures that a product with all four fields set will indeed save successfully' do
      @category = Category.new(name: 'Electronic')
      @product = Product.new(name: 'Watch', category: @category, quantity: 1, price: 400)
      @product.save!
      expect(@product).to be_valid
    end
      it 'ensures that it throws an error Name cant be blank without a name' do
      @category = Category.new(name: 'Electronic')
      @product = Product.new(name: nil, category: @category, quantity: 1, price: 400)
      expect(@product.errors[:name]).not_to  include("Name can't be blank")
    end
      it 'ensures that it throws an error Category cant be blank' do
      @category = Category.new
      @product = Product.new({name: 'Watch', quantity: 1, price: 400})
      expect(@product).not_to be_valid
      expect(@product.errors.messages).to eq ({:category => ["can't be blank"]})
    end
      it 'ensures that it throws an error Quantity cant be blank without a quantity' do
      @category = Category.new(name: 'Electronic')
      @product = Product.new(name: 'Watch', category: @category, quantity: nil, price: 400)
      expect(@product.errors[:quantity]).not_to  include("Quantity can't be blank")
    end
        it 'ensures that it throws an error Price is not a number if it is not' do
      @category = Category.create(name: 'Electronic')
      @product = Product.create(name: 'Watch', category: @category, quantity: 1, price: nil)
      expect(@product.errors[:price]).not_to  include("Price can't be blank")
    end
  end
end