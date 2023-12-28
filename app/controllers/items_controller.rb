class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

  if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name,:explanation,:category_id, :status_id, :postage_id, :shipping_id,:number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
