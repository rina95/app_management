class CreateSoftwares < ActiveRecord::Migration[7.0]
  def change
    create_table :softwares do |t|
      t.string :code, index: true
      t.string :name
      t.string :short_name
      t.integer :sw_type # ud web/mobile / ud bao cao - mis
      t.boolean :use_db_link
      t.text :use_db_link_reason
      t.boolean :use_job_schedule
      t.boolean :use_history_data
      t.integer :in_memory, default: 0 # enum

      t.timestamps
    end
  end
end
