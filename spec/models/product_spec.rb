require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     # validation tests/examples here
#     it 'should save successfully' do
#       @category = Category.create( name: "Apparel")
#       @product = Product.create(
#         name: "Something",      
#         price_cents: 11,
#         quantity: 11,
#         category_id: @category.id 
#       )
#       @product.save
#       expect(@product).to be_truthy
#     end
  
#     it 'should has a name present' do
#       @category = Category.create( name: "Apparel")
#       @product = Product.create(
#   name: "Something",      
#   price_cents: 11,
#   quantity: 11,
#   category_id: @category.id 
#       )
#       @product.save
#       @name = @product.name
#     expect(@name).to be_truthy
#     end

#     it 'should has a price present' do
#       @category = Category.create( name: "Apparel")
#       @product = Product.create(
#   name: "Something",      
#   price_cents: 125,
#   quantity: 11,
#   category_id: @category.id 
#       )
#       @product.save
#       @price = @product.price_cents
#     expect(@price).to eq 125
#     end

#     it 'should has a quantity present' do
#       @category = Category.create( name: "Apparel")
#       @product = Product.create(
#   name: "Something",      
#   price_cents: 11,
#   quantity: 12,
#   category_id: @category.id 
#       )
#       @product.save
#       @quantity = @product.quantity
#     expect(@quantity).to eq 12
#     end

#     it 'should has a category present' do
#       @category = Category.create( name: "Apparel")
#       @product = Product.create(
#   name: "Something",      
#   price_cents: 11,
#   quantity: 11,
#   category_id: @category.id
#       )
#       @product.save
#     # expect(@product.category.name).to eq "Apparel"
#     expect(@product.category_id).to eq @category.id

#     end


#   end
# end



# Now within that nested describe block, define one example for each validation. You should have the following validations in the Product model:

# Tips (read first!)
# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above