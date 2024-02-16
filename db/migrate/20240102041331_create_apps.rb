class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.integer :software_id, index: true
      t.integer :plan_id, index: true

      t.integer :app_type
      t.boolean :use_sso
      t.boolean :connect_idm
      t.boolean :connect_ecm
      t.boolean :connect_log_tt
      t.boolean :connect_open_api
      t.boolean :connect_esb
      t.boolean :use_ha
      t.boolean :use_dr
      t.boolean :use_microservice
      t.string :external_system # ht ben ngoai

      t.timestamps
    end
  end
end
