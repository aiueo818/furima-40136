class BuyAddress
  include ActiveModel::Model
  attr_accessor :user, :item_id, :post_code, :shipping_id, :city, :street_address, :building, :phone_number, :buy, :user_id, :token

  validates :shipping_id, :city, :street_address, :item_id, :token, presence: true

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンの入力が必要です' } do
    validates :post_code
  end  

  with_options presence: true, format: { with: /\A\d{10,11}\z/, message: 'はハイフン無しで入力してください' } do
    validates :phone_number
  end  

  def save
    buy = Buy.create(item_id: item_id,user_id: user_id)
    # 住所を保存する
    Address.create(post_code: post_code, shipping_id: shipping_id, city: city, street_address: street_address, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end