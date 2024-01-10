class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :post_code, :shipping_id, :city, :street_address, :building, :phone_number, :user_id, :token

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/} do
    validates :post_code
  end  

  with_options presence: true, format: { with: /\A\d{10,11}\z/ } do
    validates :phone_number
  end  

  with_options presence:true do
    validates :shipping_id, :city, :street_address, :item_id, :token, :user_id
  end

      #ジャンルの選択が「---」の時は保存できないようにする
      validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    buy = Buy.create(item_id: item_id,user_id: user_id)
    # 住所を保存する
    Address.create(post_code: post_code, shipping_id: shipping_id, city: city, street_address: street_address, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end