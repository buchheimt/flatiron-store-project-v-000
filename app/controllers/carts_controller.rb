class CartsController < ApplicationController

  def checkout
    verify_user
    @cart = Cart.find(params[:id])
    current_cart.checkout
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end

end
