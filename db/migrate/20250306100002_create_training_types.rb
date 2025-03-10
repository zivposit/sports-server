class CreateTrainingTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :training_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
