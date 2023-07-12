class CreateService < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :username
      t.string :password
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
