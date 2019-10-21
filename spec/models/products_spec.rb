require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    cat = Category.find_or_create_by! name: 'Video Games'
    
    product =  cat.products.create!({
      name: 'Super Mario', 
      price: 79.99, 
      quantity: 4}) 

    it 'is a valid save' do
      expect(product).to respond_to :save!
    end
    

    it 'is not valid without a name' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      product.price = nil
      expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it 'is not valid without a category' do
      product = Product.create({
        name: 'Super Mario', 
        price: 79.99, 
        quantity: 4
      })
      expect(product.errors.full_messages).to include('Category can\'t be blank')
      expect(product).to_not be_valid
    end


  end
end