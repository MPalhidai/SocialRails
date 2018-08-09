class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :requesting
      t.references :requested
      t.boolean :approve, default: false

      t.timestamps
    end
  end
end
