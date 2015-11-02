class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.integer :user_id
      t.string :title,              null: false

      t.timestamps null: false
    end
  end
end
