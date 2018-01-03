class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :ig
      t.integer :fit

      t.timestamps
    end
  end
end
