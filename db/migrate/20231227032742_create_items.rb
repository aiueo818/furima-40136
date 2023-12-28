class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :product_name,      null: false
      t.text       :explanation,       null: false
      t.integer    :category_id,       null: false
      t.integer    :status_id,         null: false
      t.integer    :postage_id,        null: false
      t.integer    :shipping_id,       null: false
      t.integer    :number_of_day_id,  null: false
      t.integer    :price,             null: false
      t.references :user,              null: false, foreign_key: true
    end
  end
end
