class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user_id
      t.date :birthday
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
