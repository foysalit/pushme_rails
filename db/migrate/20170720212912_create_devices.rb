class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :model
      t.string :uuid
      t.text :token
      t.string :platform

      t.timestamps null: false
    end
  end
end
