class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string     :post_code,        null:false
      t.integer    :prefectures_id,   null:false
      t.string     :city,             null:false
      t.string     :address,          null:false
      t.string     :appointment_name
      t.string     :phone_number,     null:false
      t.references :buyer,            null: false, foreign_key:true
      t.timestamps
    end
  end
end
