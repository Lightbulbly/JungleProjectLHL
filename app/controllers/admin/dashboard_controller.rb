class Admin::DashboardController < ApplicationController
  def show
    @all_products=Product.all
    @all_categories= Category.all
  end
end
