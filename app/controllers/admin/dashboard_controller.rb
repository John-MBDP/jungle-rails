class Admin::DashboardController < ApplicationController
    http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @count_product=Product.count
    @count_category=Category.count
  end
end
