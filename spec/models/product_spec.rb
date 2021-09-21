require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should create a product" do
      @category = Category.new  
      @product = Product.new(name: "Toy", price_cents: 1000, quantity: 10, :category => @category)
      expect(@product.valid?).to be true
    end

    it "should not create a product if naming is missing" do
      @category = Category.new  
      @product = Product.new(price_cents: 1000, quantity: 10, :category => @category)
      expect(@product.valid?).to be false
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "should not create a product if quantity is missing" do
      @category = Category.new  
      @product = Product.new(name: "Toy", price_cents: 1000, :category => @category)
      expect(@product.valid?).to be false
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "should not create a product if price is missing" do
      @category = Category.new  
      @product = Product.new(name: "Toy", quantity: 10, :category => @category)
      expect(@product.valid?).to be false
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it "should not create a product if category is missing" do
      @category = Category.new  
      @product = Product.new(name: "Toy", price_cents: 1000, quantity: 10)
      expect(@product.valid?).to be false
      expect(@product.errors[:category]).to include("can't be blank")
    end


  end
end 