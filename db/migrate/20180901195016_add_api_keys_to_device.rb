class AddApiKeysToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :write_key, :string
    add_column :devices, :read_key, :string
  end
end
