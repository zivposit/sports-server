class CreateGuides < ActiveRecord::Migration[8.0]
  def change
    create_table :guides do |t|
      t.string :title

      t.timestamps
    end
  end
end
