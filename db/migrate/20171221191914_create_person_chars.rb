class CreatePersonChars < ActiveRecord::Migration[5.1]
  def change
    create_table :person_chars do |t|
      t.references :person, foreign_key: true
      t.references :char, foreign_key: true
      t.string :input

      t.timestamps
    end
  end
end
