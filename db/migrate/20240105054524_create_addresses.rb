class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table   :addresses do |t|
      t.string     :post_code,      null: false
      t.integer    :shipping_id,    null: false
      t.string     :city,           null: false
      t.string     :street_address, null: false
      t.string     :building
      t.string     :phone_number,   null: false
      t.references :buy,            null: false, foreign_key: true
    end
  end
end