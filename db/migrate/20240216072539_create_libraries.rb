class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name, index: true
      t.string :link_doc
      t.integer :min_version_x
      t.integer :min_version_y
      t.integer :min_version_z

      t.timestamps
    end
  end
end
