class CreateSubgeneres < ActiveRecord::Migration[5.1]
  def change
    create_table :subgeneres do |t|
      t.string :name
      t.references :genere, foreign_key: true

      t.timestamps
    end
  end
end
