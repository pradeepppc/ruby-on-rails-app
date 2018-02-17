class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :ques
      t.string :opa
      t.string :opb
      t.string :opc
      t.string :opd
      t.string :ans
      t.references :subgenere, foreign_key: true

      t.timestamps
    end
  end
end
