class CreateChars < ActiveRecord::Migration[5.1]
  def change
    create_table :chars do |t|
      t.string :name

      t.timestamps
    end
  end
end
