class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :member_id, foreign_key: true
      t.integer :room_id, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
