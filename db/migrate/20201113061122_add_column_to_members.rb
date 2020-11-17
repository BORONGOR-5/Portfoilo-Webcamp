class AddColumnToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :name, :string
    add_column :members, :introduction, :text
    add_column :members, :profile_image_id, :string
    add_column :members, :sex, :integer
    add_column :members, :birthday, :date
    add_column :members, :best1, :string
    add_column :members, :best2, :string
    add_column :members, :best3, :string
    add_column :members, :is_deleted, :boolean, default: false, null: false
  end
end
