class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:admin_username], password: Rails.configuration.admin[:admin_password]

  def show
    @products = Product.all.count
    @category = Category.all.count
  end

end

