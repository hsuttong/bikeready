class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      # t.string :email
      # t.string :password_digest
      t.string :phone
      t.string :lat
      t.string :lng 

      t.timestamps null: false
    end
  end
end
