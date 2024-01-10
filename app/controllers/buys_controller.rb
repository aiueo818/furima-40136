class BuysController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
    
    if @item.buy != nil
      redirect_to root_path
    end
  end

  def show
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    price = @item.price
    if @buy_address.valid?
      pay_item(price)
      @buy_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :shipping_id, :city, :street_address, :building, :phone_number, :buy).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item(price)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: price,
        card: buy_params[:token],
        currency: 'jpy'
    )
  end

end