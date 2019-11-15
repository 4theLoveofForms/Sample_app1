class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :about_me

      t.timestamps
    end
  end
end
