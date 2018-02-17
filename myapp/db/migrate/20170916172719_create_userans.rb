class CreateUserans < ActiveRecord::Migration[5.1]
  def change
    create_table :userans do |t|
      t.integer :comp
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
