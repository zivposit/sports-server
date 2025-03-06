class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :id_number, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birth_date, null: false
      t.date :join_date

      t.references :training_type, null: false, foreign_key: true

      t.timestamps
    end

    add_index :trainers, :id_number, unique: true
  end
end
