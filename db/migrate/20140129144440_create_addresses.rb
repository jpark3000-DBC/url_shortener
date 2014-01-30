class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :long
      t.string :short
      t.integer :count, default: 0
      t.belongs_to :user
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
