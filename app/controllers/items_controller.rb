class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  def index
    @items = Item.all
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  if @item.update(item_params)
    redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name,:explanation,:category_id, :status_id, :postage_id, :shipping_id,:number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end

end