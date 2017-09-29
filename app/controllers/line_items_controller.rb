class LineItemsController < ApplicationController

  def create
    if ! cart = current_user.current_cart
      cart = current_user.build_current_cart
    end
    cart.add_item(params[:item_id]).save
    cart.save
    current_user.save
    redirect_to cart_path(cart)
  end

end
