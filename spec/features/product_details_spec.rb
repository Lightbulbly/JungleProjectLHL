require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
end

  scenario "Clicking on product link shows details" do
    # ACT
    visit root_path
    first('.product').click_link('Details')
    # first(:link, 'Details').click
    # DEBUG / VERIF
    sleep(3)
    # puts page.html
    save_screenshot('products_details.png')
    expect(page).to have_css '.products-show', count: 1
    
  end

end


  
 

 