class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.references :device, foreign_key: true
      t.string :grouping_type
      t.integer :grouping_interval
      t.string :metric_type
      t.string :name
      t.string :grouping_field
      t.string :metric_field
      t.string :order

      t.timestamps
    end
  end
end
