class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.string :device_uid
      t.datetime :datetime
      t.jsonb :data
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
