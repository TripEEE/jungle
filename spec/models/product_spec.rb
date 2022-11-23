require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do

    before do
      @name = "Sock"
      @price = 100
      @quantity = 5 
      @category = Category.create(name: "Clothing")
      @product = Product.new
    end

    it "will save if all fields are entered" do
      product = Product.new(name: @name, category: @category, quantity: @quantity, price: @price)
      product.save
      expect(product.errors.full_messages).to be_empty
    end

    it "must fail a save if no name is entered" do
      product = Product.new(category: @category, quantity: @quantity, price: @price)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank") 
    end

    it "must fail a save if no price is entered properly" do
      product = Product.new(name: @name, category: @category, quantity: @quantity)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank", "Price is not a number") 
    end

    it "must fail a save if no quantity is entered" do
      product = Product.new(name: @name, category: @category, price: @price)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank") 
    end

    it "must fail a save if no category is entered" do
      product = Product.new(name: @name, quantity: @quantity, price: @price)
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end