class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :name, null: false

      t.timestamps
    end

    # If you want each studio's name to be unique:
    add_index :studios, :name, unique: true
  end
end