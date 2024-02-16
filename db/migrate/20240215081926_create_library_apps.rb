class CreateLibraryApps < ActiveRecord::Migration[7.0]
  def change
    create_table :library_apps do |t|
      t.integer :library_id, index: true
      t.integer :app_id, index: true
      t.integer :version_x
      t.integer :version_y
      t.integer :version_z

      t.timestamps
    end
  end
end
