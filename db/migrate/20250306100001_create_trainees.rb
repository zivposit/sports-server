class CreateTrainees < ActiveRecord::Migration[7.0]
  def change
    create_table :trainees do |t|
      t.string :id_number, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birth_date, null: false
      t.date :join_date

      t.timestamps
    end

    add_index :trainees, :id_number, unique: true
  end
end
