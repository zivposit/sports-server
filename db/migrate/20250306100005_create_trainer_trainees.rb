class CreateTrainerTrainees < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_trainees do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :trainee, null: false, foreign_key: true

      t.timestamps
    end

    add_index :trainer_trainees, [:trainer_id, :trainee_id], unique: true
  end
end
