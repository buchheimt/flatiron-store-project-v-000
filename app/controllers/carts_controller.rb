class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    verify_user
    @cart = Cart.find(params[:id])
    current_cart.checkout
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end

end
