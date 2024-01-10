class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :shipping
  belongs_to :number_of_day
  has_one :buy
  belongs_to :user
  has_one_attached :image

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    #空の投稿を保存できないようにする
    validates :product_name, :explanation, :category_id, :status_id, :postage_id, :shipping_id, :number_of_day_id, :price, :image,  presence: true

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :number_of_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end