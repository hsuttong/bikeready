class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :name
      t.string :color
      t.string :status
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
