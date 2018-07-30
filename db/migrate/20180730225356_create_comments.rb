class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user_id
      t.references :post_id

      t.timestamps
    end
  end
end