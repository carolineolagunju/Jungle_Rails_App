require 'rails_helper'
RSpec.describe Product, type: :model do

  describe 'Validations' do
    describe 'Product' do
      it 'should save product successfully' do
        category = Category.create(name: 'Trees')
        product = Product.new(
          name: 'Bamboo',
          price: 500,
          quantity: 2,
          category: category
        )
        expect(product).to be_valid
      end
    end

    describe 'name' do
      it 'should validate presence of name' do
        category = Category.create(name: 'Trees')
        product = Product.new(
          name: nil,
          price: 500,
          quantity: 2,
          category: category
        )

        product.save
        expect(product.errors.full_messages).to include("Name can't be blank")
      end
    end

    describe 'price' do
      it 'should validate presence of price' do
        category = Category.create(name: 'Trees')
        product = Product.new(
          name: 'Bamboo',
          quantity: 2,
          category: category
        )

        product.save
        expect(product.errors.full_messages).to include("Price can't be blank")
      end
    end

    describe 'quantity' do
      it 'should validate presence of quantity' do
        category = Category.create(name: 'Trees')
        product = Product.new(
          name: 'Bamboo',
          price: 310,
          category: category
        )

        product.save
        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    describe 'category' do
      it 'should validate presence of category' do
        # category = Category.create(name: '')
        product = Product.new(
          name: 'Bamboo',
          price: 310,
          quantity: 10,
          category: nil
        )

        product.save
        expect(product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
