class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :requesting_id
      t.references :requested_id
      t.boolean :approve

      t.timestamps
    end
  end
end
