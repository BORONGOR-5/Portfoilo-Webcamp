class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :member_id
      t.integer :review_id
      t.text :review_comment

      t.timestamps
    end
  end
end
