class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :member_id
      t.integer :movie_id
      t.string :title
      t.text :impression
      t.float :rate

      t.timestamps
    end
  end
end
