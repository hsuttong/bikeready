class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :street
      t.string :zip_code
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
