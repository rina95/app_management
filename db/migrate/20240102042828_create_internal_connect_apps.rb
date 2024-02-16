class CreateInternalConnectApps < ActiveRecord::Migration[7.0]
  def change
    create_table :internal_connect_apps   do |t|
      t.integer :app_id, index: true
      t.integer :software_id, index: true

      t.integer :connect_type # enum

      t.timestamps
    end
  end
end
