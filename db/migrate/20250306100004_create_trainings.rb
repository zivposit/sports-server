class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :training_type, null: false, foreign_key: true
      t.references :studio, null: true, foreign_key: true

      t.datetime :date_time, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end